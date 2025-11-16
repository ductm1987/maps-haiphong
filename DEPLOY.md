# 🚀 Hướng dẫn Deploy ứng dụng

Ứng dụng này có thể deploy lên nhiều nền tảng miễn phí. Dưới đây là hướng dẫn chi tiết cho từng nền tảng.

---

## 🎯 Tùy chọn 1: GitHub Pages (Đề xuất - Miễn phí, Tự động)

### ✅ Ưu điểm:
- Hoàn toàn miễn phí
- Tự động deploy khi push code
- Domain miễn phí: `username.github.io/maps-haiphong`
- SSL/HTTPS tự động
- Tích hợp sẵn với GitHub

### 📋 Các bước thực hiện:

#### Bước 1: Enable GitHub Pages

1. Truy cập repository trên GitHub:
   ```
   https://github.com/ductm1987/maps-haiphong
   ```

2. Vào tab **Settings** (⚙️)

3. Scroll xuống phần **Pages** (menu bên trái)

4. Trong mục **Source**:
   - Chọn: **GitHub Actions**
   - (Hoặc nếu không có option này, chọn branch `main` và folder `/ (root)`)

5. Click **Save**

#### Bước 2: Chờ GitHub Actions chạy

1. Vào tab **Actions** trên repository

2. Xem workflow **"Deploy to GitHub Pages"** đang chạy

3. Chờ khoảng 1-2 phút để deploy hoàn tất

4. Khi thấy ✅ màu xanh là thành công

#### Bước 3: Truy cập ứng dụng

Ứng dụng sẽ có địa chỉ:
```
https://ductm1987.github.io/maps-haiphong
```

### 🔄 Cập nhật sau này

Mỗi khi bạn push code mới lên branch `main`:
```bash
git add .
git commit -m "Update content"
git push origin main
```

GitHub Actions sẽ **tự động deploy** lại trong vòng 1-2 phút!

---

## 🎯 Tùy chọn 2: Netlify (Dễ nhất, Miễn phí)

### ✅ Ưu điểm:
- Cực kỳ dễ dùng
- Deploy trong 30 giây
- Domain miễn phí: `random-name.netlify.app`
- Có thể đổi tên miễn phí
- SSL/HTTPS tự động
- CDN toàn cầu (rất nhanh)

### 📋 Cách 1: Deploy qua Git (Đề xuất)

#### Bước 1: Tạo tài khoản

1. Truy cập: https://app.netlify.com/signup
2. Đăng nhập bằng GitHub account

#### Bước 2: Import repository

1. Click **"Add new site"** → **"Import an existing project"**

2. Chọn **GitHub**

3. Authorize Netlify truy cập GitHub

4. Chọn repository: **ductm1987/maps-haiphong**

5. Cấu hình build:
   - **Branch to deploy**: `main`
   - **Build command**: (để trống)
   - **Publish directory**: `.` (hoặc để trống)

6. Click **"Deploy site"**

#### Bước 3: Đợi deploy

- Netlify sẽ build trong ~30 giây
- Khi xong, bạn sẽ có URL: `https://random-name.netlify.app`

#### Bước 4: Đổi tên (Optional)

1. Vào **Site settings** → **Change site name**
2. Đổi thành: `haiphong-admin-lookup`
3. URL mới: `https://haiphong-admin-lookup.netlify.app`

### 📋 Cách 2: Deploy qua Netlify Drop (Nhanh nhất)

1. Truy cập: https://app.netlify.com/drop

2. Kéo thả toàn bộ folder `maps-haiphong` vào

3. Đợi 10 giây → Xong!

**Lưu ý:** Cách này không tự động cập nhật khi bạn thay đổi code.

### 🔄 Tự động deploy

Sau khi kết nối với GitHub:
- Mỗi lần push code lên branch `main`
- Netlify tự động deploy lại
- Không cần làm gì thêm!

---

## 🎯 Tùy chọn 3: Vercel (Nhanh nhất)

### ✅ Ưu điểm:
- Cực nhanh (CDN toàn cầu)
- Deploy trong 20 giây
- Domain miễn phí: `project-name.vercel.app`
- SSL/HTTPS tự động
- Preview cho mỗi Pull Request

### 📋 Các bước thực hiện:

#### Bước 1: Tạo tài khoản

1. Truy cập: https://vercel.com/signup
2. Đăng nhập bằng GitHub

#### Bước 2: Import project

1. Click **"Add New"** → **"Project"**

2. Chọn repository: **ductm1987/maps-haiphong**

3. Cấu hình:
   - **Framework Preset**: Other
   - **Root Directory**: ./
   - **Build Command**: (để trống)
   - **Output Directory**: (để trống)

4. Click **"Deploy"**

#### Bước 3: Đợi deploy

- Deploy trong ~20 giây
- URL: `https://maps-haiphong.vercel.app`

### 🔄 Tự động deploy

- Mỗi lần push lên `main` → Tự động deploy
- Mỗi Pull Request → Tạo preview URL riêng

---

## 🎯 Tùy chọn 4: Cloudflare Pages

### ✅ Ưu điểm:
- Hoàn toàn miễn phí
- CDN cực nhanh (200+ locations)
- Unlimited bandwidth
- SSL/HTTPS tự động

### 📋 Các bước:

1. Truy cập: https://pages.cloudflare.com/

2. Đăng nhập (hoặc tạo tài khoản miễn phí)

3. Click **"Create a project"**

4. Connect GitHub → Chọn repository

5. Build settings:
   - **Build command**: (để trống)
   - **Build output directory**: `/`

6. Click **"Save and Deploy"**

7. URL: `https://maps-haiphong.pages.dev`

---

## 🎯 Tùy chọn 5: Firebase Hosting

### ✅ Ưu điểm:
- Tích hợp với Google
- CDN toàn cầu
- Free tier rất hào phóng

### 📋 Các bước:

#### 1. Cài đặt Firebase CLI

```bash
npm install -g firebase-tools
```

#### 2. Login Firebase

```bash
firebase login
```

#### 3. Init project

```bash
cd /home/user/maps-haiphong
firebase init hosting
```

Trả lời:
- **What do you want to use as your public directory?** `.`
- **Configure as a single-page app?** `No`
- **Set up automatic builds?** `No`

#### 4. Deploy

```bash
firebase deploy
```

#### 5. URL

```
https://your-project-id.web.app
```

---

## 📊 So sánh các nền tảng

| Nền tảng | Tốc độ Deploy | Tự động | Domain miễn phí | CDN | Độ khó |
|----------|---------------|---------|-----------------|-----|--------|
| **GitHub Pages** | ⭐⭐⭐ | ✅ | ✅ | ✅ | Dễ |
| **Netlify** | ⭐⭐⭐⭐⭐ | ✅ | ✅ | ✅ | Rất dễ |
| **Vercel** | ⭐⭐⭐⭐⭐ | ✅ | ✅ | ✅ | Dễ |
| **Cloudflare** | ⭐⭐⭐⭐ | ✅ | ✅ | ✅ | Dễ |
| **Firebase** | ⭐⭐⭐ | ❌ | ✅ | ✅ | Trung bình |

---

## 🎯 Đề xuất của tôi

### Cho người mới:
👉 **Netlify** - Dễ nhất, nhanh nhất, ít config nhất

### Cho developer:
👉 **GitHub Pages** - Tích hợp sẵn, tự động, không phải lo

### Cho performance:
👉 **Vercel** hoặc **Cloudflare Pages** - Nhanh nhất

---

## 🔧 Troubleshooting

### Lỗi: "Page not found" trên GitHub Pages

**Giải pháp:**
1. Kiểm tra Settings → Pages → Source đã chọn đúng branch
2. Đợi 1-2 phút sau khi enable
3. Xóa cache trình duyệt (Ctrl + Shift + R)

### Lỗi: "Deploy failed" trên Netlify

**Giải pháp:**
1. Kiểm tra build log
2. Đảm bảo không có file lỗi
3. Thử deploy lại

### Custom Domain không hoạt động

**Giải pháp:**
1. Đợi DNS propagate (có thể mất 24-48 giờ)
2. Kiểm tra DNS records đã trỏ đúng chưa
3. Enable HTTPS trong settings

---

## 🌐 Custom Domain (Nâng cao)

Nếu bạn có domain riêng (vd: `haiphong-admin.com`):

### GitHub Pages:
1. Tạo file `CNAME` với nội dung: `haiphong-admin.com`
2. Settings → Pages → Custom domain: nhập domain
3. Cấu hình DNS:
   ```
   Type: A
   Name: @
   Value: 185.199.108.153
         185.199.109.153
         185.199.110.153
         185.199.111.153
   ```

### Netlify:
1. Domain settings → Add custom domain
2. Làm theo hướng dẫn của Netlify
3. SSL tự động enable sau vài phút

### Vercel:
1. Project Settings → Domains
2. Add domain
3. Cấu hình DNS theo hướng dẫn

---

## ✅ Checklist Deploy

- [ ] Code đã được push lên GitHub
- [ ] Chọn nền tảng deploy
- [ ] Tạo tài khoản trên nền tảng đó
- [ ] Connect repository
- [ ] Configure build settings (nếu cần)
- [ ] Deploy
- [ ] Test ứng dụng trên URL production
- [ ] (Optional) Setup custom domain
- [ ] (Optional) Enable analytics

---

## 🎉 Kết luận

Ứng dụng của bạn đã sẵn sàng deploy! Chọn một trong các option trên và làm theo hướng dẫn.

**Khuyến nghị nhanh nhất:**
1. Vào https://app.netlify.com
2. Kéo thả folder vào
3. Xong trong 30 giây! 🚀

Nếu cần hỗ trợ, hãy liên hệ qua GitHub Issues!
