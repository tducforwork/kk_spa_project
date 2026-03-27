<?php

namespace App\Http\Controllers\Admin;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\MenuGroup;
use App\Models\MenuItem;
use App\Models\Language;
use Illuminate\Http\Request;

class MenuItemController extends Controller
{
    public function index(Request $request)
    {
        $pageTitle = 'Menu Items';
        $groups    = MenuGroup::active()->get();
        $locations = MenuGroup::active()->distinct()->pluck('location');
        $query     = MenuItem::query();

        if ($request->group_id) {
            $query->where('menu_group_id', $request->group_id);
        }

        if ($request->location) {
            $query->whereHas('group', function ($q) use ($request) {
                $q->where('location', $request->location);
            });
        }

        // Fetch all matching items to build the tree
        $all      = $query->with('group', 'parent', 'translations')->orderBy('order', 'asc')->get();
        $items    = [];
        $processedIds = [];

        // Identify root items (items with parent_id = 0 or whose parent is not in the current set)
        $rootItems = $all->filter(function ($item) use ($all) {
            return $item->parent_id == 0 || !$all->contains('id', $item->parent_id);
        });

        foreach ($rootItems as $root) {
            $this->flattenTree($root, $all, $items, $processedIds);
        }

        // Convert array to collection for compatibility
        $items = collect($items);
        
        // Manual pagination if needed, but for menus we usually show all items in the tree
        // If we must paginate, we paginate the root items and then flatten, but that breaks the UI
        // I will stick to showing the full tree for the selected group/location
        
        return view('admin.menu.item.index', compact('pageTitle', 'items', 'groups', 'locations'));
    }

    private function flattenTree($item, $all, &$items, &$processedIds, $depth = 0)
    {
        if (in_array($item->id, $processedIds)) return;
        
        $item->depth = $depth;
        $items[]     = $item;
        $processedIds[] = $item->id;

        $children = $all->where('parent_id', $item->id)->sortBy('order');
        foreach ($children as $child) {
            $this->flattenTree($child, $all, $items, $processedIds, $depth + 1);
        }
    }

    public function create()
    {
        $pageTitle = 'Add Menu Item';
        $groups    = MenuGroup::active()->get();
        $languages = Language::all();
        return view('admin.menu.item.create', compact('pageTitle', 'groups', 'languages'));
    }

    public function edit($id)
    {
        $pageTitle = 'Edit Menu Item';
        $item      = MenuItem::findOrFail($id);
        $groups    = MenuGroup::active()->get();
        $parents   = MenuItem::where('menu_group_id', $item->menu_group_id)->where('id', '!=', $id)->get();
        $languages = Language::all();
        return view('admin.menu.item.edit', compact('pageTitle', 'item', 'groups', 'parents', 'languages'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'menu_group_id' => 'required|exists:menu_groups,id',
            'parent_id'     => 'nullable|integer',
            'title'         => 'required|string|max:255',
            'url'           => 'required|string|max:255',
            'order'         => 'nullable|integer',
        ]);

        if ($id) {
            $item = MenuItem::findOrFail($id);
            $notification = 'Menu item updated successfully';
        } else {
            $item = new MenuItem();
            $notification = 'Menu item created successfully';
        }

        $item->menu_group_id = $request->menu_group_id;
        $item->parent_id     = $request->parent_id ?: 0;
        $item->title         = $request->title;
        $item->url           = $request->url;
        $item->order         = $request->order ?: 0;
        $item->save();

        if ($request->translations) {
            foreach ($request->translations as $langCode => $translation) {
                $item->translations()->updateOrCreate(
                    ['lang_code' => $langCode],
                    [
                        'title' => $translation['title'] ?? $request->title,
                    ]
                );
            }
        }

        $notify[] = ['success', $notification];
        return to_route('admin.menu.item.index')->withNotify($notify);
    }

    public function remove($id)
    {
        $item = MenuItem::findOrFail($id);
        $item->delete();
        $notify[] = ['success', 'Menu item deleted successfully'];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        return MenuItem::changeStatus($id);
    }

    public function getParents(Request $request)
    {
        $parents = MenuItem::where('menu_group_id', $request->group_id)->where('parent_id', 0);
        if ($request->item_id) {
            $parents->where('id', '!=', $request->item_id);
        }
        return response()->json($parents->get());
    }
}
