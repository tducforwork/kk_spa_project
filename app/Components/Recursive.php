<?php

namespace App\Components;

class Recursive
{
    private $data;
    private $htmlSelect = '';

    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build interactive category tree for select options.
     * Expects translated names via $value->t->name
     */
    public function categoryRecursive($parentId = 0, $selectedId = 0, $id = 0, $text = '')
    {
        foreach ($this->data as $value) {
            if ($value->parent_id == $id) {
                $selected = ($value->id == $selectedId) ? 'selected' : '';
                $this->htmlSelect .= "<option value='" . $value->id . "' " . $selected . ">" . $text . ($value->t->name ?? 'No Name') . "</option>";
                $this->categoryRecursive($parentId, $selectedId, $value->id, $text . '--');
            }
        }
        return $this->htmlSelect;
    }
}
