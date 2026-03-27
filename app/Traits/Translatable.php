<?php

namespace App\Traits;

use App\Models\Language;

trait Translatable
{
    /**
     * Get the translation for a specific language or the current locale.
     *
     * @param string|null $langCode
     * @return mixed
     */
    public function getTranslation($langCode = null)
    {
        $langCode = $langCode ?: app()->getLocale();
        
        $translation = $this->translations()->where('lang_code', $langCode)->first();

        if (!$translation) {
            // Fallback to default language using the scope defined in Language model
            $defaultLang = Language::default()->first();
            if ($defaultLang && $defaultLang->code != $langCode) {
                $translation = $this->translations()->where('lang_code', $defaultLang->code)->first();
            }
        }

        // If still no translation, return the first one available
        return $translation ?: $this->translations()->first();
    }

    /**
     * Scope a query to include translations efficiently.
     */
    public function scopeWithTranslation($query, $langCode = null)
    {
        $langCode = $langCode ?: app()->getLocale();
        return $query->with(['translations' => function ($q) use ($langCode) {
            $q->where('lang_code', $langCode);
        }]);
    }

    /**
     * Attribute getter for easy access to translated name/title/slug etc.
     * Usage: $model->t->name
     */
    public function getTAttribute()
    {
        return $this->getTranslation();
    }
}
