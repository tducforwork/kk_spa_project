# KK Spa Project - Laravel Project Documentation

Tài liệu này cung cấp cái nhìn chi tiết về cấu trúc, logic và cách vận hành của dự án Laravel **KK Spa Project**. Phù hợp cho lập trình viên mới bắt đầu tiếp cận và phát triển dự án.

## 1. Tổng quan dự án

- **Mô tả**: Dự án là một hệ thống quản lý Spa/Job Lab (dựa trên bộ source ViserLab) tích hợp đặt phòng, quản lý nhà hàng, bài viết và hệ thống thông báo đa kênh.
- **Tech Stack**:
    - **Framework**: Laravel 11.x
    - **PHP**: ^8.3
    - **Cơ sở dữ liệu**: Hỗ trợ SQLite (mặc định trong .env.example), MySQL.
    - **Package chính**: 
        - `authorizenet/authorizenet`: Thanh toán.
        - `intervention/image`: Xử lý hình ảnh.
        - `laramin/utility`: Tiện ích lõi (VugiChugi).
        - `laravel/socialite`: Đăng nhập mạng xã hội.
        - `phpmailer/phpmailer`: Gửi email qua SMTP.
- **Nhóm người dùng**:
    1. **Admin**: Quản trị viên toàn quyền hệ thống (Cấu hình, quản lý User, Frontend, Room, Restaurant, Post).
    2. **User**: Người dùng đã đăng ký (Quản lý profile, nạp tiền, gửi ticket hỗ trợ, bảo mật 2FA).
    3. **Guest (Public)**: Khách truy cập (Xem blog, liên hệ, đăng ký).

---

## 2. Cấu trúc thư mục quan trọng

### 📂 `app/Http/Controllers/`
Quản lý logic xử lý yêu cầu. Chia làm 2 namespace chính:

- **`Admin/`**:
    - `AdminController.php`: Dashboard admin, quản lý profile/password admin.
    - `ManageUsersController.php`: Quản lý danh sách, trạng thái, và thông tin chi tiết người dùng.
    - `RoomController.php`: Quản lý phòng (CRUD).
    - `RestaurantController.php`: Quản lý nhà hàng và menu.
    - `PostController.php`: Quản lý bài viết/tin tức.
    - `PageBuilderController.php`: Quản lý các trang và layout động.
    - `FrontendController.php`: Xử lý nội dung các section (About, Banner...).
    - `NotificationController.php`: Cấu hình email/sms/push notification templates.
- **`User/`**:
    - `UserController.php`: Dashboard user, 2FA, Device tokens.
    - `ProfileController.php`: Cài đặt thông tin cá nhân user.
    - `AuthorizationController.php`: Xác thực Email/SMS/2FA cho user.
- **Root Controllers**:
    - `SiteController.php`: Xử lý các trang public (Home, Contact, Blog, Policy).
    - `TicketController.php`: Hệ thống ticket hỗ trợ khách hàng.

### 📂 `app/Http/Middleware/`
- `Authenticate.php`: Xác thực người dùng đã đăng nhập.
- `CheckStatus.php`: Kiểm tra tài khoản user có bị ban hay chưa xác thực không.
- `RedirectIfNotAdmin.php` (aliased `admin`): Bảo vệ route admin, chuyển hướng nếu không phải admin.
- `RedirectIfAdmin.php` (aliased `admin.guest`): Chặn admin vào trang login khi đã đăng nhập.
- `ActiveTemplateMiddleware.php`: Load template đang hoạt động của hệ thống.
- `LanguageMiddleware.php`: Thiết lập ngôn ngữ dựa trên session.
- `MaintenanceMode.php`: Chặn truy cập khi hệ thống bật chế độ bảo trì.

### 📂 `app/Models/`
- `User.php`: Thông tin người dùng. Quan hệ: `hasMany(DeviceToken)`, `hasMany(UserLogin)`.
- `Admin.php`: Thông tin quản trị viên.
- `Room.php`: Thông tin phòng. Quan hệ: `belongsTo(CategoryRoom)`, `hasMany(RoomImage)`, `hasMany(RoomTranslation)`.
- `Restaurant.php`: Thông tin nhà hàng. Quan hệ: `hasMany(RestaurantMenu)`, `hasMany(RestaurantImage)`.
- `Post.php`: Bài viết. Quan hệ: `belongsTo(CategoryPost)`, `hasMany(PostTranslation)`.
- `Frontend.php`: Lưu trữ nội dung các section CMS.
- `Page.php`: Lưu trữ cấu trúc các trang builder.
- `SupportTicket.php`: Quản lý các trao đổi hỗ trợ.

### 📂 `resources/views/`
- `admin/`: View dành cho quản trị viên (layouts, folder theo module).
- `templates/basic/`: Giao diện mặc định cho User và Guest.
    - `layouts/frontend.blade.php`: Layout trang chủ/public.
    - `layouts/user_dashboard.blade.php`: Layout cho dashboard người dùng.
    - `sections/`: Các khối nội dung động (banner, about...).

### 📂 `routes/`
- `admin.php`: Prefix `/admin`. Middleware: `admin`. Quản lý mọi tác vụ admin.
- `user.php`: Prefix `/user`. Middleware: `user`. Quản lý dashboard và chức năng user.
- `web.php`: Các route public (Home, Blog, Contact, Ticket).

---

## 3. Routing Chi Tiết

| Method | URI | Controller@method | Middleware | Mô tả |
| :--- | :--- | :--- | :--- | :--- |
| **Public** | | | | |
| GET | `/` | `SiteController@index` | `web`, `maintenance` | Trang chủ |
| GET | `/blog` | `SiteController@blog` | `web`, `maintenance` | Danh sách bài viết |
| GET | `/contact` | `SiteController@contact` | `web`, `maintenance` | Trang liên hệ |
| **Admin** | | | | |
| GET | `/admin/dashboard` | `AdminController@dashboard` | `admin`, `admin.permission` | Dashboard Admin |
| GET | `/admin/room` | `RoomController@index` | `admin`, `admin.permission` | Quản lý danh sách phòng |
| GET | `/admin/frontend/manage-pages`| `PageBuilderController@managePages`| `admin`, `admin.permission` | Quản lý trang builder |
| **User** | | | | |
| GET | `/user/dashboard` | `UserController@home` | `user`, `check.status` | Dashboard User |
| GET | `/user/profile-setting` | `ProfileController@profile` | `user`, `check.status` | Cài đặt cá nhân |

---

## 4. Flow xử lý (Module Đăng nhập)

**Flow: User Login**
1. **Route**: `user/php` -> `Route::get('/login', 'showLoginForm')`
2. **Controller**: `App\Http\Controllers\User\Auth\LoginController.php` -> `showLoginForm()`
3. **View**: `resources/views/templates/basic/user/auth/login.blade.php`
4. **Post Logic**: `login()` -> Xác thực qua `Auth::guard('user')->attempt()`
5. **Middleware**: `RedirectIfAuthenticated` (guest:user) chặn người đã login vào lại.
6. **Redirect**: Sau khi login thành công, chuyển hướng về `user/dashboard`.

---

## 5. Middleware Map

- **`admin` (`RedirectIfNotAdmin`)**: Áp dụng cho toàn bộ route trong `admin.php`. Kiểm tra session `admin_id`. Nếu fail, chuyển về `/admin`.
- **`user` (`User`)**: Áp dụng trong `user.php`. Thiết lập guard `user` làm mặc định cho request.
- **`check.status` (`CheckStatus`)**: Kiểm tra user có bị khóa (`status = 0`) hoặc chưa xác thực email/sms không. Nếu fail, chuyển về trang error hoặc authorization.
- **`maintenance` (`MaintenanceMode`)**: Kiểm tra cấu hình `maintenance_mode` trong database. Nếu bật, chỉ cho phép admin hoặc các route `placeholder-image` truy cập.

---

## 6. Website Management (FAQ cho Dev)

### 🏠 Cách sửa nội dung Trang Chủ (Home)?
Trang chủ được xây dựng bằng **Page Builder**.
- **Admin Panel**: Vào `Frontend Manager` -> `Manage Pages`. Tìm trang có slug là `/` (Home).
- **Manage Sections**: Nhấn vào icon "Manage Sections" để thêm/bớt/sắp xếp các khối nội dung (Banner, About, Feature...).
- **Code View**: Giao diện chính tại `resources/views/templates/basic/home.blade.php`. Nó sẽ render từng section được loop từ database.

### 📄 Cách tạo trang mới?
1. **Admin Panel**: Vào `Frontend Manager` -> `Manage Pages` -> Nhấn **Add New**.
2. **Cấu hình**: Nhập tên trang và Slug. Sau khi tạo, hệ thống tự động sinh ra route xử lý tại `SiteController@pages`.
3. **Thêm nội dung**: Sử dụng trình builder để kéo thả các section vào trang mới.
4. **Manual**: Nếu muốn tạo trang tĩnh hoàn toàn bằng code, hãy tạo route mới trong `web.php` và controller xử lý riêng.

### 📧 Gửi email ở đâu?
Hệ thống sử dụng Class `App\Notify\Notify.php` làm trung tâm.
- **Gửi Email**: Gọi hàm helper `notify($user, 'TEMPLATE_NAME', $shortCodes)`.
- **Logic vận chuyển**: Nằm tại `app/Notify/Email.php`. Hỗ trợ: `SMTP`, `PHP Mail`, `SendGrid`, `Mailjet`.
- **Cấu hình**: Admin vào `Notification Setting` -> `Email Setting` để thiết lập SMTP Server.
- **Templates**: Sửa nội dung email tại `Notification Setting` -> `Notification Templates`.

---

## 7. Cấu hình hệ thống (System Settings)

Hệ thống quản lý toàn bộ cấu hình thông qua bảng `general_settings` và được truy xuất qua helper `gs()`.

### ⚙️ Logic xử lý Cấu hình chung
- **Controller**: `app/Http/Controllers/Admin/GeneralSettingController.php`.
- **Model**: `app/Models/GeneralSetting.php`.
- **Cơ chế Cache**: Khi lưu bất kỳ cấu hình nào, hệ thống tự động gọi `Cache::forget('GeneralSetting')` trong Model Boot để reload dữ liệu mới nhất.

#### Các module cấu hình chính:
1. **General Setting**: 
   - Quản lý Tên site, Tiền tệ, Múi giờ, Màu sắc chủ đạo (`base_color`).
   - Cập nhật múi giờ trực tiếp vào file `config/timezone.php`.
2. **System Configuration**: 
   - Bật/Tắt các tính năng toàn cục: Đăng ký thành viên, Force SSL, Xác thực Email/SMS/Push, Đa ngôn ngữ.
   - Các flag này (ví dụ: `ev`, `sv`, `en`, `sn`) quyết định xem Middleware `CheckStatus` có yêu cầu người dùng xác thực hay không.
3. **Logo & Favicon**: 
   - Lưu trữ tại `public/assets/images/logoIcon/`.
   - Các file cố định: `logo.png`, `logo_dark.png`, `favicon.png`.
4. **Custom CSS**: 
   - Cho phép Admin ghi đè CSS mà không cần can thiệp vào code source. 
   - Nội dung được ghi trực tiếp vào `public/assets/templates/basic/css/custom.css`.

### 🔔 Hệ thống Thông báo (Notification)
- **Controller**: `app/Http/Controllers/Admin/NotificationController.php`.
- **Cấu hình gửi**:
    - **Email**: Hỗ trợ PHP Mail, SMTP, SendGrid, Mailjet.
    - **SMS**: Hỗ trợ đa dạng gateway (Twilio, Nexmo, Infobip...).
    - **Push**: Sử dụng Firebase Cloud Messaging (FCM).
- **Template**:
    - Mỗi hành động (Đăng ký, Đổi mật khẩu...) có một template riêng cho từng kênh (Email, SMS, Push).
    - Có thể Bật/Tắt riêng lẻ từng kênh cho từng template.

---

## 8. Quản lý Layout & Assets

### 🎨 Vị trí Layout (Giao diện khung)
- **Frontend (Giao diện người dùng)**:
    - Root Layout: `resources/views/templates/basic/layouts/app.blade.php` (Chứa thẻ `<html>`, `<head>`, `<body>`).
    - Giao diện chung: `resources/views/templates/basic/layouts/frontend.blade.php`.
    - Giao diện Dashboard User: `resources/views/templates/basic/layouts/user_dashboard.blade.php`.
- **Backend (Giao diện Admin)**:
    - Root Layout: `resources/views/admin/layouts/master.blade.php`.
    - Wrapper Layout: `resources/views/admin/layouts/app.blade.php`.

### 🛠 Cách thêm CSS / JS
Dự án sử dụng cách quản lý asset truyền thống (không dùng Vite/Mix cho các file public).
1. **Lưu trữ**: 
   - CSS: `public/assets/templates/basic/css/` (cho FE) hoặc `public/assets/admin/css/` (cho BE).
   - JS: `public/assets/templates/basic/js/` hoặc `public/assets/admin/js/`.
   - Global (Thư viện dùng chung): `public/assets/global/`.
2. **Cách nhúng vào Layout**:
   - Sử dụng helper `asset()` trong Blade:
     ```html
     <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/custom_new.css') }}">
     <script src="{{ asset('assets/templates/basic/js/custom_new.js') }}"></script>
     ```
3. **Thêm cho từng trang cụ thể**:
   - Sử dụng `@push` vào các stack đã định nghĩa sẵn trong Layout:
     ```php
     @push('style')
        <style> /* CSS cụ thể cho trang */ </style>
     @endpush

     @push('script')
        <script> /* JS cụ thể cho trang */ </script>
     @endpush
     ```

### 🖼 Quản lý Ảnh tĩnh (Static Images)
1. **Vị trí lưu trữ**:
   - Ảnh hệ thống (Logo, Favicon): `public/assets/images/logoIcon/`.
   - Ảnh mặc định/Placeholder: `public/assets/images/default.png`.
   - Ảnh Frontend (Banner, Section images): `public/assets/images/frontend/`.
   - Ảnh do người dùng upload: `public/assets/images/`.
2. **Cách sử dụng trong Blade**:
   - Sử dụng helper `getImage($path, $size)` để hiển thị ảnh kèm theo kiểm tra tồn tại và placeholder:
     ```php
     <img src="{{ getImage(getFilePath('userProfile') . '/' . $user->image) }}" alt="User Image">
     ```
   - Các hàm helper đặc biệt:
     - `siteLogo()`: Hiển thị logo trang web.
     - `siteFavicon()`: Hiển thị favicon.
     - `frontendImage($sectionName, $image, $size)`: Hiển thị ảnh của một section cụ thể.
3. **Cấu hình đường dẫn**:
   Các đường dẫn và kích thước ảnh được định nghĩa tập trung trong class `app/Lib/FileManager.php`.

---

## 8. Hướng dẫn thêm tính năng mới

Để thêm một module mới (ví dụ: "Dịch vụ Spa"):
1. **Database**: Tạo migration `php artisan make:migration create_services_table`.
2. **Model**: Tạo model `app/Models/Service.php` (sử dụng trait `Translatable` nếu cần đa ngôn ngữ).
3. **Controller**: Tạo controller trong `app/Http/Controllers/Admin/ServiceController.php` xử lý CRUD.
4. **Routes**: Khai báo Group route trong `admin.php` với middleware `admin` và `admin.permission`.
5. **Views**: Tạo thư mục `resources/views/admin/service/` và các file `index.blade.php`, `edit.blade.php`.
6. **Navigation**: Thêm menu link vào `resources/views/admin/partials/sidenav.blade.php`.

---
*Tài liệu được tạo tự động bởi Antigravity AI Assistant.*
