# 🏛️ Tra cứu địa chỉ Cơ quan Hành chính Hải Phòng

Ứng dụng web tra cứu địa chỉ các cơ quan hành chính tại Hải Phòng sau sát nhập với Hải Dương, giúp người dân dễ dàng tìm kiếm và di chuyển đến các trụ sở mới.

## 📋 Tổng quan

Sau khi sát nhập giữa tỉnh Hải Dương và thành phố Hải Phòng, nhiều cơ quan hành chính đã thay đổi địa điểm trụ sở, gây khó khăn cho người dân khi cần làm thủ tục hành chính. Ứng dụng này được xây dựng nhằm:

- ✅ Cung cấp thông tin chính xác về địa chỉ mới của các cơ quan
- ✅ Tích hợp Google Maps để chỉ đường tự động
- ✅ Hiển thị thông tin chi tiết: điện thoại, giờ làm việc, dịch vụ
- ✅ Giao diện thân thiện, dễ sử dụng trên mọi thiết bị

## 🚀 Tính năng

### 1. Tìm kiếm thông minh
- Tìm kiếm theo tên cơ quan
- Tìm kiếm theo quận/huyện
- Tìm kiếm theo dịch vụ cung cấp
- Gợi ý kết quả ngay khi nhập

### 2. Bộ lọc nâng cao
- Lọc theo loại cơ quan (UBND quận/huyện, Sở ngành, v.v.)
- Lọc theo khu vực địa lý
- Kết hợp nhiều bộ lọc đồng thời

### 3. Tích hợp Google Maps
- Xem vị trí trên bản đồ
- Chỉ đường từ vị trí hiện tại
- Mở trực tiếp trong ứng dụng Google Maps

### 4. Giao diện responsive
- Tương thích với desktop, tablet, mobile
- Chế độ xem danh sách và lưới
- Thiết kế hiện đại, dễ sử dụng

### 5. Thông tin chi tiết
- Địa chỉ đầy đủ
- Số điện thoại liên hệ
- Giờ làm việc
- Danh sách dịch vụ cung cấp
- Ghi chú đặc biệt (nếu có)

## 📁 Cấu trúc dự án

```
maps-haiphong/
├── index.html              # Trang chính
├── styles.css              # Stylesheet
├── app.js                  # Logic ứng dụng
├── data/
│   └── addresses.json      # Cơ sở dữ liệu địa chỉ
└── README.md              # Tài liệu này
```

## 🛠️ Cài đặt và sử dụng

### Yêu cầu
- Trình duyệt web hiện đại (Chrome, Firefox, Safari, Edge)
- Không cần cài đặt server

### Cách 1: Mở trực tiếp file HTML

1. Clone repository:
```bash
git clone https://github.com/your-username/maps-haiphong.git
cd maps-haiphong
```

2. Mở file `index.html` bằng trình duyệt:
```bash
# MacOS
open index.html

# Linux
xdg-open index.html

# Windows
start index.html
```

### Cách 2: Sử dụng Local Server

Để tránh lỗi CORS khi load file JSON, bạn có thể chạy local server:

#### Sử dụng Python
```bash
# Python 3
python -m http.server 8000

# Sau đó mở: http://localhost:8000
```

#### Sử dụng Node.js (http-server)
```bash
# Cài đặt
npm install -g http-server

# Chạy
http-server

# Mở: http://localhost:8080
```

#### Sử dụng PHP
```bash
php -S localhost:8000
# Mở: http://localhost:8000
```

#### Sử dụng Live Server (VS Code Extension)
1. Cài extension "Live Server" trong VS Code
2. Click chuột phải vào `index.html`
3. Chọn "Open with Live Server"

### Cách 3: Deploy lên hosting

Ứng dụng này là static site, có thể deploy lên:

- **GitHub Pages**: Miễn phí, dễ sử dụng
- **Netlify**: Tự động deploy từ Git
- **Vercel**: Nhanh, CDN toàn cầu
- **Firebase Hosting**: Tích hợp với Google
- **Cloudflare Pages**: Miễn phí, nhanh

#### Deploy lên GitHub Pages

1. Push code lên GitHub repository
2. Vào Settings > Pages
3. Chọn branch `main` và folder `/ (root)`
4. Click Save
5. Truy cập: `https://your-username.github.io/maps-haiphong`

## 📝 Cập nhật dữ liệu

Để cập nhật hoặc thêm địa chỉ mới, chỉnh sửa file `data/addresses.json`:

```json
{
  "id": "unique-id",
  "name": "Tên cơ quan",
  "category": "Loại cơ quan",
  "district": "Quận/Huyện",
  "address": "Địa chỉ đầy đủ",
  "phone": "Số điện thoại",
  "workingHours": "Giờ làm việc",
  "latitude": 20.xxxx,
  "longitude": 106.xxxx,
  "services": ["Dịch vụ 1", "Dịch vụ 2"],
  "notes": "Ghi chú (optional)"
}
```

### Lấy tọa độ GPS:

1. Truy cập [Google Maps](https://maps.google.com)
2. Tìm địa điểm
3. Click chuột phải > "What's here?"
4. Copy tọa độ (latitude, longitude)

## 🎨 Tùy chỉnh giao diện

Chỉnh sửa biến CSS trong file `styles.css`:

```css
:root {
    --primary-color: #1e3a8a;      /* Màu chủ đạo */
    --secondary-color: #3b82f6;    /* Màu phụ */
    --accent-color: #06b6d4;       /* Màu nhấn */
    /* ... */
}
```

## 📱 Tương thích

- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

## 🔧 Troubleshooting

### Lỗi: "Failed to fetch data"
- **Nguyên nhân**: CORS policy khi mở trực tiếp file HTML
- **Giải pháp**: Sử dụng local server (xem phần Cài đặt)

### Bản đồ không hiển thị
- **Nguyên nhân**: Kết nối internet kém hoặc Google Maps bị chặn
- **Giải pháp**: Kiểm tra kết nối, thử trình duyệt khác

### Tìm kiếm không hoạt động
- **Nguyên nhân**: JavaScript bị vô hiệu hóa
- **Giải pháp**: Bật JavaScript trong trình duyệt

## 🤝 Đóng góp

Mọi đóng góp đều được hoan nghênh! Vui lòng:

1. Fork repository
2. Tạo branch mới (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Mở Pull Request

### Đóng góp dữ liệu

Nếu phát hiện thông tin sai lệch hoặc muốn thêm địa chỉ mới:

1. Tạo Issue với label `data-update`
2. Cung cấp thông tin đầy đủ và chính xác
3. Đính kèm nguồn tham khảo (nếu có)

## 📄 License

MIT License - Xem file [LICENSE](LICENSE) để biết thêm chi tiết.

## 👥 Tác giả

- **Developer**: Your Name
- **Email**: your.email@example.com
- **GitHub**: [@your-username](https://github.com/your-username)

## 🙏 Lời cảm ơn

- UBND Thành phố Hải Phòng vì cung cấp thông tin công khai
- Cộng đồng mã nguồn mở
- Google Maps Platform

## 📞 Liên hệ

Nếu có thắc mắc hoặc góp ý, vui lòng:

- Tạo Issue trên GitHub
- Email: your.email@example.com
- Facebook: [Your Page](https://facebook.com/yourpage)

## 🔄 Cập nhật

### Version 1.0.0 (2025-11-16)
- ✅ Phiên bản đầu tiên
- ✅ 20 địa điểm cơ quan hành chính
- ✅ Tích hợp Google Maps
- ✅ Tìm kiếm và lọc thông minh
- ✅ Giao diện responsive

### Kế hoạch tương lai
- 🔜 Thêm chức năng lưu địa điểm yêu thích
- 🔜 Hỗ trợ offline với Service Worker
- 🔜 Thêm đánh giá và nhận xét
- 🔜 Tích hợp Zalo Map, Here Maps
- 🔜 Ứng dụng di động (React Native / Flutter)

---

**Lưu ý**: Thông tin trong ứng dụng có thể thay đổi. Vui lòng liên hệ trực tiếp với cơ quan để xác nhận trước khi đến.
