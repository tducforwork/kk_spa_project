# Technical Migration Specification: Room & Cuisine Modules

This document provides a detailed blueprint of the Room and Cuisine management modules, intended for migration or recreation in a new system.

## 1. Core Architectural Patterns

### 1.1 Multi-language Support

Entities use a "Translation Table" pattern. For every main entity `X`, there is a corresponding `x_translations` table.

- **Main Table**: Stores non-translatable data (IDs, prices, status, images, foreign keys).
- **Translation Table**: Stores translatable fields (name, slug, content, description, SEO metadata) and a `language` column (e.g., 'vi', 'en').

### 1.2 Centralized Slug (URL) Management

All frontend URLs are managed in a central `keys` table.

- **Table `keys`**: `id`, `slug`, `type`, `key_id`, `language`.
- **Types Mapping**:
    - `type 1`: Category (Cuisine/Posts)
    - `type 2`: Item (Cuisine/Posts)
    - `type 3`: Category (Room/Products)
    - `type 4`: Item (Room/Products)
- **Benefit**: Allows a single middleware to resolve any slug to the correct controller/entity.

---

## 2. Room Management Module

### 2.1 Database Schema

#### Table: `category_rooms` (Recursive Categories)

- `id` (int, PK)
- `parent_id` (int, default 0)
- `avatar_path`, `icon_path`, `banner_path`, `banner_mobile_path` (string)
- `order` (int)
- `active` (tinyint)
- `admin_id` (int, FK)

#### Table: `rooms`

- `id` (int, PK)
- `category_id` (int, FK)
- `price`, `price_old` (decimal/bigint)
- `avatar_path`, `banner_path`, `banner_mobile_path` (string)
- `hot`, `active` (tinyint)
- `order` (int)
- `admin_id` (int, FK)

#### Table: `room_images` (Gallery)

- `id` (int, PK)
- `room_id` (int, FK)
- `image_path` (string)
- `alt_image` (string)

#### Translatable Tables

- `category_room_translations`: `name`, `slug`, `description`, `content`, `title_seo`, `description_seo`, `keyword_seo`.
- `room_translations`: `name`, `slug`, `description`, `content`, `acreage` (diện tích), `direction` (hướng), `bed`, `capacity`, `bathroom`, `title_seo`, `description_seo`, `keyword_seo`.

---

## 3. Cuisine Management Module

### 3.1 Database Schema

#### Table: `category_cuisines` (Recursive)

- Similar structure to `category_rooms`.
- Additional field: `url` (optional external link).

#### Table: `cuisines`

- `id` (int, PK)
- `category_id` (int, FK)
- `price`, `price_old` (bigint)
- `avatar_path`, `banner_path` (string)
- `order`, `active` (tinyint)

#### Translatable Tables

- `category_cuisine_translations` & `cuisine_translations`: Standard fields (name, slug, content, SEO).

---

## 4. Key Business Logic

### 4.1 Image Handling

Uses a trait (`StorageImageTrait`) to save files:

- **Paths**: Usually stored in `public/uploads/rooms/` or `public/uploads/category-room/`.
- **Processing**: Uses `Intervention Image` for resizing/processing if needed.
- **Deletions**: Syncs file deletion with database record deletion using `DeleteRecordTrait`.

### 4.2 Recursive Category Tree

- Uses a `Recusive` component to build parent-child options for Select tags.
- Logic: `getHtmlOption($parentId)` iterates through all categories to build a nested tree structure.

### 4.3 Saving Process (Controller)

1. **Transaction**: Wrap everything in `DB::beginTransaction()`.
2. **Main Entity**: Create/Update the record in the main table.
3. **Images**: Handle file uploads via Tray/Service.
4. **Translations**: Loop through active languages and Create/Update records in the translations table.
5. **Slugs**: Update the central `keys` table for each language.
6. **Commit/Rollback**: `DB::commit()` if successful.
