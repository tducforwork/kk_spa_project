<?php

namespace App\Services;

use App\Models\Key;
use App\Models\Post;
use App\Models\Room;
use App\Models\Restaurant;
use App\Models\MiceEvent;
use App\Models\Facility;
use App\Models\SpecialOffer;
use App\Models\CategoryPost;
use App\Models\CategoryRoom;
use App\Models\CategoryRestaurant;

class ContentService
{
    /**
     * Map Key types to their handling configurations
     */
    protected $typeMap = [
        Key::TYPE_POST => [
            'model'        => Post::class,
            'with'         => ['translations'],
            'view'         => 'templates.details.post',
            'variable'     => 'post',
            'parent'       => ['name' => 'Travel Guide', 'url' => '/travel-guide'],
            'image_folder' => 'post',
        ],
        Key::TYPE_ROOM => [
            'model'        => Room::class,
            'with'         => ['translations', 'images', 'introImages'],
            'view'         => 'templates.details.room',
            'variable'     => 'room',
            'parent'       => ['name' => 'Accommodation', 'url' => '/accommodation'],
            'image_folder' => 'room',
        ],
        Key::TYPE_RESTAURANT => [
            'model'        => Restaurant::class,
            'with'         => ['translations', 'images', 'introImages'],
            'view'         => 'templates.details.restaurant',
            'variable'     => 'restaurant',
            'parent'       => ['name' => 'Gastronomy', 'url' => '/gastronomy'],
            'image_folder' => 'restaurant',
        ],
        Key::TYPE_MICE_EVENT => [
            'model'        => MiceEvent::class,
            'with'         => ['translations', 'images', 'introImages'],
            'view'         => 'templates.details.mice_event',
            'variable'     => 'event',
            'parent'       => ['name' => 'MICE & Events', 'url' => '/mice-events'],
            'image_folder' => 'mice_event',
        ],
        Key::TYPE_FACILITY => [
            'model'        => Facility::class,
            'with'         => ['translations', 'images', 'introImages'],
            'view'         => 'templates.details.facility',
            'variable'     => 'facility',
            'parent'       => ['name' => 'Facilities', 'url' => '#'],
            'image_folder' => 'facility',
        ],
        Key::TYPE_SPECIAL_OFFER => [
            'model'        => SpecialOffer::class,
            'with'         => ['translations', 'images', 'introImages'],
            'view'         => 'templates.details.special_offer',
            'variable'     => 'offer',
            'parent'       => ['name' => 'Special Offers', 'url' => '/offers'],
            'image_folder' => 'special_offer',
        ],
    ];

    /**
     * Resolve slug and return data for controller
     */
    public function getDetails(Key $key)
    {
        $config = $this->typeMap[$key->type] ?? null;

        if (!$config) {
            return null;
        }

        $relations = [];
        foreach ($config['with'] as $relation) {
            if ($relation === 'images') {
                $relations['images'] = function ($q) {
                    $q->where('type', 1);
                };
            } elseif ($relation === 'introImages') {
                $relations['introImages'] = function ($q) {
                    $q->where('type', 2);
                };
            } else {
                $relations[] = $relation;
            }
        }

        $item = $config['model']::with($relations)->findOrFail($key->key_id);

        return [
            'item'         => $item,
            'view'         => $config['view'],
            'variable'     => $config['variable'],
            'pageTitle'    => $item->getTranslation()->name ?? $item->name,
            'breadcrumbs'  => $config['parent'] ?? null,
            'image_folder' => $config['image_folder'] ?? null,
        ];
    }
}
