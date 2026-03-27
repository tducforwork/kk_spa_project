<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use App\Constants\FileInfo;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Schema;

class OptimizeImages extends Command
{
    protected $signature = 'image:optimize {--path= : Chỉ tối ưu đường dẫn cụ thể (ví dụ: assets/images/mice_event)} {--limit=100 : Giới hạn số lượng ảnh xử lý}';
    protected $description = 'Tối ưu hóa ảnh cũ: Resize, nén 80% và chuyển sang WebP, sau đó cập nhật database.';

    public function handle()
    {
        ini_set('memory_limit', '512M');
        $this->info('Bắt đầu quá trình tối ưu hóa hình ảnh TOÀN CỤC...');

        $manager = new ImageManager(new Driver());
        $limit = $this->option('limit');
        $processedCount = 0;

        // Quét toàn bộ thư mục images
        $basePath = public_path('assets/images');
        if (!is_dir($basePath)) {
            $this->error("Thư mục $basePath không tồn tại.");
            return;
        }

        $files = File::allFiles($basePath);
        $this->info("Tìm thấy " . count($files) . " tệp tin. Đang kiểm tra...");

        foreach ($files as $file) {
            if ($processedCount >= $limit) break;

            $ext = strtolower($file->getExtension());
            
            // Nếu là ảnh gốc, tiến hành tối ưu
            if (in_array($ext, ['jpg', 'jpeg', 'png'])) {
                $this->optimize($manager, $file);
                $processedCount++;
            } 
            // Nếu đã là webp, vẫn chạy cập nhật DB để đảm bảo đồng bộ (Force Sync)
            elseif ($ext === 'webp') {
                $this->syncDatabase($file);
            }
        }

        $this->info("Hoàn thành! Đã xử lý $processedCount ảnh.");
    }

    protected function optimize($manager, $file)
    {
        $oldName = $file->getFilename();
        $pathInfo = pathinfo($oldName);
        $newName = $pathInfo['filename'] . '.webp';
        
        $fullOldPath = $file->getPathname();
        $fullNewPath = $file->getPath() . DIRECTORY_SEPARATOR . $newName;

        try {
            $image = $manager->read($fullOldPath);
            
            // Resize tối đa 1800px chiều rộng (giữ tỷ lệ, chỉ thu nhỏ không phóng to)
            $image->scaleDown(width: 1800)->sharpen(5);
            
            // Lưu dưới dạng webp (Chất lượng 90 để cực nét)
            $image->toWebp(90)->save($fullNewPath);

            // Cập nhật Database
            $this->updateDatabaseReferences($oldName, $newName);

            // Xóa ảnh gốc NẾU ảnh cũ không phải là ảnh mới (tránh xóa nhầm tệp vừa save)
            if (realpath($fullOldPath) !== realpath($fullNewPath)) {
                @unlink($fullOldPath);
                $this->line("<info>Tối ưu từ ảnh gốc:</info> $oldName -> $newName");
            } else {
                $this->line("<info>Nâng cấp chất lượng WebP:</info> $oldName");
            }

        } catch (\Exception $e) {
            $this->error("Lỗi khi xử lý $oldName: " . $e->getMessage());
            // Đảm bảo không bị dừng cả script
        }
    }

    protected function syncDatabase($file)
    {
        $webpName = $file->getFilename();
        $pathInfo = pathinfo($webpName);
        $baseName = $pathInfo['filename'];

        // Thử cập nhật cho cả 3 định dạng cũ có thể có
        $this->updateDatabaseReferences($baseName . '.png', $webpName);
        $this->updateDatabaseReferences($baseName . '.jpg', $webpName);
        $this->updateDatabaseReferences($baseName . '.jpeg', $webpName);
    }

    protected function updateDatabaseReferences($oldName, $newName)
    {
        $tables = Schema::getTables();

        foreach ($tables as $table) {
            $tableName = is_array($table) ? $table['name'] : $table->name;
            $columns = Schema::getColumns($tableName);

            foreach ($columns as $column) {
                $columnName = $column['name'];
                $typeName = strtolower($column['type_name']);

                // Chỉ quét các cột có khả năng chứa chuỗi
                if (in_array($typeName, ['varchar', 'text', 'mediumtext', 'longtext', 'string', 'json'])) {
                    DB::table($tableName)
                        ->where($columnName, 'LIKE', '%' . $oldName . '%')
                        ->update([
                            $columnName => DB::raw("REPLACE($columnName, '$oldName', '$newName')")
                        ]);
                }
            }
        }
    }
}
