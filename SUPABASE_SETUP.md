## 🗄️ Hướng dẫn Setup Supabase cho ứng dụng

Hướng dẫn chi tiết từng bước để kết nối ứng dụng với Supabase database.

---

## 📋 Mục lục

1. [Tạo tài khoản Supabase](#1-tạo-tài-khoản-supabase)
2. [Tạo Project mới](#2-tạo-project-mới)
3. [Tạo Database Table](#3-tạo-database-table)
4. [Import dữ liệu](#4-import-dữ-liệu)
5. [Lấy API credentials](#5-lấy-api-credentials)
6. [Cấu hình ứng dụng](#6-cấu-hình-ứng-dụng)
7. [Test kết nối](#7-test-kết-nối)
8. [Troubleshooting](#8-troubleshooting)

---

## 1. Tạo tài khoản Supabase

### Bước 1.1: Đăng ký

1. Truy cập: https://supabase.com
2. Click **"Start your project"** hoặc **"Sign Up"**
3. Chọn phương thức đăng ký:
   - **GitHub** (đề xuất - nhanh nhất)
   - **Email** (cần verify email)

### Bước 1.2: Verify email (nếu dùng email)

- Check email inbox
- Click link xác nhận
- Đăng nhập vào Supabase

✅ **Hoàn thành bước 1**

---

## 2. Tạo Project mới

### Bước 2.1: Tạo Organization (lần đầu)

1. Sau khi đăng nhập, bạn sẽ thấy trang "Create Organization"
2. Nhập tên organization: `haiphong-admin` (hoặc tên bạn muốn)
3. Click **"Create organization"**

### Bước 2.2: Tạo Project

1. Click **"New project"**
2. Điền thông tin:
   - **Name**: `maps-haiphong`
   - **Database Password**: Tạo password mạnh (lưu lại an toàn!)
   - **Region**: Chọn **Southeast Asia (Singapore)** (gần Việt Nam nhất)
   - **Pricing Plan**: Chọn **Free** (0$/month)

3. Click **"Create new project"**

4. Đợi khoảng 1-2 phút để Supabase setup database

✅ **Hoàn thành bước 2** - Bạn đã có Supabase project!

---

## 3. Tạo Database Table

### Bước 3.1: Mở SQL Editor

1. Trong project dashboard, click **"SQL Editor"** (menu bên trái)
2. Click **"New query"**

### Bước 3.2: Chạy Schema SQL

1. Copy toàn bộ nội dung file `supabase/schema.sql`
2. Paste vào SQL Editor
3. Click **"Run"** (hoặc Ctrl/Cmd + Enter)

**Kết quả:** Bạn sẽ thấy thông báo "Success. No rows returned"

### Bước 3.3: Verify Table

1. Click **"Table Editor"** (menu bên trái)
2. Bạn sẽ thấy table **`locations`** đã được tạo
3. Table hiện đang rỗng (0 rows)

✅ **Hoàn thành bước 3** - Database table đã sẵn sàng!

---

## 4. Import dữ liệu

### Cách 1: Sử dụng SQL Editor (Đề xuất)

#### Bước 4.1: Mở SQL Editor

1. Click **"SQL Editor"** → **"New query"**

#### Bước 4.2: Chạy Insert SQL

1. Copy toàn bộ nội dung file `supabase/insert_data.sql`
2. Paste vào SQL Editor
3. Click **"Run"**

**Kết quả:** Bạn sẽ thấy:
```
Success. 1 row(s) returned
total_locations: 20
```

#### Bước 4.3: Verify Data

1. Click **"Table Editor"** → **`locations`**
2. Bạn sẽ thấy 20 records đã được import

### Cách 2: Import CSV (Alternative)

1. Export data từ `data/addresses.json` sang CSV
2. Trong Table Editor, click **"Insert"** → **"Import data from CSV"**
3. Upload file CSV
4. Map các columns
5. Click **"Import"**

✅ **Hoàn thành bước 4** - Đã import 20 địa điểm!

---

## 5. Lấy API Credentials

### Bước 5.1: Mở Settings

1. Click icon ⚙️ **Settings** (menu bên trái, ở dưới cùng)
2. Click **"API"**

### Bước 5.2: Copy credentials

Bạn cần 2 thông tin:

#### 1. Project URL
```
Ví dụ: https://abcdefghijklmnop.supabase.co
```
- Tìm ở phần **"Project URL"**
- Click icon copy bên cạnh

#### 2. Anon Public Key
```
Ví dụ: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZi...
```
- Tìm ở phần **"Project API keys"**
- Copy key có label **"anon" "public"**
- Đây là key dài khoảng 200+ ký tự
- Click icon copy bên cạnh

**⚠️ LƯU Ý:**
- **KHÔNG** copy "service_role" key (key này có quyền admin, nguy hiểm!)
- **CHỈ** dùng "anon public" key (key này an toàn cho frontend)

✅ **Hoàn thành bước 5** - Đã có credentials!

---

## 6. Cấu hình ứng dụng

### Bước 6.1: Mở file config.js

Mở file `config.js` trong thư mục dự án.

### Bước 6.2: Cập nhật credentials

Thay thế `YOUR_PROJECT_URL` và `YOUR_ANON_KEY` bằng thông tin của bạn:

```javascript
const SUPABASE_CONFIG = {
    // Paste Project URL vào đây
    url: 'https://abcdefghijklmnop.supabase.co',

    // Paste Anon Public Key vào đây
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',

    tableName: 'locations' // Không cần thay đổi
};
```

### Bước 6.3: Lưu file

- Save file `config.js`
- **QUAN TRỌNG:** Không commit file này lên public repo nếu có sensitive data!

✅ **Hoàn thành bước 6** - Ứng dụng đã được cấu hình!

---

## 7. Test kết nối

### Bước 7.1: Chạy ứng dụng

**Cách 1 - Python:**
```bash
cd /path/to/maps-haiphong
python -m http.server 8000
```

**Cách 2 - Node.js:**
```bash
npx http-server
```

**Cách 3 - PHP:**
```bash
php -S localhost:8000
```

### Bước 7.2: Mở trình duyệt

1. Truy cập: `http://localhost:8000/index-supabase.html`
2. Mở Developer Console (F12)

### Bước 7.3: Kiểm tra kết quả

**Thành công nếu thấy:**
- Console hiển thị: `✅ Supabase initialized successfully`
- Console hiển thị: `✅ Loaded 20 locations from Supabase`
- Ứng dụng hiển thị 20 địa điểm

**Lỗi nếu thấy:**
- `⚠️ Vui lòng cấu hình Supabase trong file config.js`
  → Kiểm tra lại file `config.js`

- `Error loading data from Supabase`
  → Kiểm tra Project URL và API key

### Bước 7.4: Test chức năng

- ✅ Tìm kiếm hoạt động
- ✅ Bộ lọc hoạt động
- ✅ Click vào card hiển thị chi tiết
- ✅ Nút "Chỉ đường" mở Google Maps

✅ **Hoàn thành bước 7** - Ứng dụng hoạt động hoàn hảo!

---

## 8. Troubleshooting

### Lỗi: "Supabase initialization failed"

**Nguyên nhân:** Chưa cấu hình `config.js`

**Giải pháp:**
1. Mở file `config.js`
2. Đảm bảo đã thay `YOUR_PROJECT_URL` và `YOUR_ANON_KEY`
3. Save file và refresh trang

---

### Lỗi: "Failed to load data"

**Nguyên nhân:**
- URL hoặc API key sai
- Table chưa có dữ liệu
- CORS policy

**Giải pháp:**

1. **Kiểm tra URL:**
   - URL phải bắt đầu với `https://`
   - URL phải kết thúc với `.supabase.co`
   - Không có dấu `/` ở cuối

2. **Kiểm tra API Key:**
   - Copy lại từ Settings → API
   - Đảm bảo copy đúng "anon public" key
   - Key phải là chuỗi dài ~200 ký tự

3. **Kiểm tra data:**
   - Vào Table Editor
   - Đảm bảo table `locations` có 20 rows

4. **Kiểm tra RLS Policy:**
   - Vào Authentication → Policies
   - Đảm bảo có policy "Allow public read access"

---

### Lỗi: "No data found in Supabase"

**Nguyên nhân:** Table rỗng

**Giải pháp:**
1. Vào SQL Editor
2. Chạy lại file `supabase/insert_data.sql`
3. Verify trong Table Editor

---

### Lỗi CORS

**Nguyên nhân:** Mở file HTML trực tiếp (file://)

**Giải pháp:** Phải chạy qua local server:
```bash
python -m http.server 8000
```

---

## 🎉 Hoàn tất Setup!

Bạn đã hoàn thành setup Supabase! Giờ đây:

✅ Dữ liệu được lưu trên cloud (Supabase)
✅ Có thể cập nhật data qua Supabase Dashboard
✅ Không cần push code khi thay đổi data
✅ Database có full-text search, indexes
✅ Tự động backup
✅ Free tier: 500MB database, 2GB file storage

---

## 🔄 Cập nhật dữ liệu sau này

### Thêm địa điểm mới

1. Vào Supabase Dashboard → Table Editor
2. Click **"Insert row"**
3. Điền thông tin:
   - id: `unique-id`
   - name: `Tên cơ quan`
   - category: `Loại cơ quan`
   - district: `Quận/Huyện`
   - address: `Địa chỉ`
   - phone: `Số điện thoại`
   - working_hours: `Giờ làm việc`
   - latitude: `20.xxxx`
   - longitude: `106.xxxx`
   - services: `["Dịch vụ 1", "Dịch vụ 2"]` (JSON format)
   - notes: `Ghi chú`
4. Click **"Save"**

### Sửa thông tin

1. Vào Table Editor
2. Click vào row cần sửa
3. Edit các fields
4. Click **"Save"**

### Xóa địa điểm

1. Vào Table Editor
2. Click checkbox bên trái row
3. Click **"Delete selected rows"**

**Lưu ý:** Thay đổi trên Supabase sẽ có hiệu lực ngay lập tức!

---

## 📊 So sánh JSON vs Supabase

| Tính năng | File JSON | Supabase Database |
|-----------|-----------|-------------------|
| **Cập nhật data** | Phải sửa file, commit, push | Sửa qua Dashboard, hiệu lực ngay |
| **Backup** | Phải tự backup | Tự động backup |
| **Search** | Client-side (chậm) | Server-side (nhanh) |
| **Scalability** | Giới hạn | Không giới hạn |
| **Offline** | ✅ Hoạt động | ❌ Cần internet |
| **Authentication** | Không | ✅ Có sẵn |
| **Real-time** | Không | ✅ Có sẵn |

---

## 🔐 Bảo mật

### File config.js

Nếu deploy public, **KHÔNG** commit file `config.js` trực tiếp.

**Thay vào đó:**

1. Tạo file `config.example.js`:
```javascript
const SUPABASE_CONFIG = {
    url: 'YOUR_PROJECT_URL',
    anonKey: 'YOUR_ANON_KEY',
    tableName: 'locations'
};
```

2. Thêm `config.js` vào `.gitignore`:
```
config.js
```

3. Hướng dẫn người dùng:
   - Copy `config.example.js` thành `config.js`
   - Điền thông tin Supabase của họ

**Hoặc dùng Environment Variables:**

```javascript
const SUPABASE_CONFIG = {
    url: import.meta.env.VITE_SUPABASE_URL,
    anonKey: import.meta.env.VITE_SUPABASE_ANON_KEY,
    tableName: 'locations'
};
```

---

## 📞 Hỗ trợ

Nếu gặp vấn đề:

1. **Supabase Docs:** https://supabase.com/docs
2. **Supabase Discord:** https://discord.supabase.com
3. **GitHub Issues:** Tạo issue với label `supabase`

---

**Chúc bạn sử dụng Supabase hiệu quả!** 🚀
