<?php

namespace App\Http\Controllers\Admin;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\MenuGroup;
use Illuminate\Http\Request;

class MenuGroupController extends Controller
{
    public function index()
    {
        $pageTitle = 'Menu Groups';
        $groups    = MenuGroup::orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.menu.group.index', compact('pageTitle', 'groups'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'name'     => 'required|string|max:255',
            'location' => 'required|string|max:100|unique:menu_groups,location,' . $id,
        ]);

        if ($id) {
            $group = MenuGroup::findOrFail($id);
            $notification = 'Menu group updated successfully';
        } else {
            $group = new MenuGroup();
            $notification = 'Menu group created successfully';
        }

        $group->name     = $request->name;
        $group->location = $request->location;
        $group->save();

        $notify[] = ['success', $notification];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $group = MenuGroup::findOrFail($id);
        $group->delete();
        $notify[] = ['success', 'Menu group deleted successfully'];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        return MenuGroup::changeStatus($id);
    }
}
