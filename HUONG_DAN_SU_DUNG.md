# 📖 Hướng dẫn sử dụng nhanh

## 🚀 Chạy ứng dụng

### Cách đơn giản nhất (Python)

Mở terminal tại thư mục dự án và chạy:

```bash
python -m http.server 8000
```

Sau đó mở trình duyệt và truy cập: **http://localhost:8000**

### Các cách khác

**Node.js:**
```bash
npx http-server
```

**PHP:**
```bash
php -S localhost:8000
```

## 🎯 Cách sử dụng ứng dụng

### 1. Tìm kiếm địa chỉ

**Bước 1:** Nhập từ khóa vào ô tìm kiếm
- Tên cơ quan: "UBND Hồng Bàng", "Sở Giáo dục"
- Quận/huyện: "Lê Chân", "Ngô Quyền"
- Dịch vụ: "khai sinh", "hộ khẩu", "đất đai"

**Bước 2:** Kết quả hiển thị ngay lập tức

### 2. Lọc theo tiêu chí

**Loại cơ quan:**
- UBND Quận/Huyện
- Sở, Ban ngành
- Cơ quan cấp TP
- Trung tâm Hành chính

**Quận/Huyện:**
- Chọn từ danh sách dropdown

### 3. Xem thông tin chi tiết

**Cách 1:** Click vào thẻ cơ quan

**Cách 2:** Click nút "Chi tiết"

Thông tin hiển thị:
- 📍 Địa chỉ đầy đủ
- 📞 Số điện thoại
- 🕐 Giờ làm việc
- 🛠️ Danh sách dịch vụ
- 🗺️ Bản đồ nhúng

### 4. Chỉ đường tự động

**Cách 1:** Từ trang chính
- Click nút "Chỉ đường" trên thẻ cơ quan

**Cách 2:** Từ trang chi tiết
- Click "Chỉ đường từ vị trí của tôi"

**Kết quả:**
- Mở Google Maps với lộ trình từ vị trí hiện tại
- Hướng dẫn từng bước
- Ước tính thời gian và khoảng cách

### 5. Xem trên bản đồ

Click nút "Xem trên bản đồ":
- Mở Google Maps ở chế độ xem
- Khám phá khu vực xung quanh
- Tìm điểm đến gần đó

### 6. Thay đổi chế độ hiển thị

**Chế độ danh sách (☰):**
- Hiển thị chi tiết từng cơ quan
- Dễ đọc trên desktop

**Chế độ lưới (⊞):**
- Hiển thị nhiều cơ quan cùng lúc
- Phù hợp với màn hình lớn

## 📱 Sử dụng trên Mobile

1. Mở trình duyệt trên điện thoại
2. Truy cập địa chỉ ứng dụng
3. Cho phép truy cập vị trí (nếu được hỏi)
4. Tìm kiếm như bình thường
5. Click "Chỉ đường" sẽ mở app Google Maps

## 💡 Mẹo sử dụng

### Tìm kiếm nhanh
- Gõ tắt: "ubnd hong" → UBND Quận Hồng Bàng
- Tìm theo dịch vụ: "passport" → Công an TP

### Kết hợp bộ lọc
- Chọn "Sở ngành" + "Hồng Bàng" = Tìm sở ngành ở Hồng Bàng

### Lưu trang
- Bookmark trang để truy cập nhanh
- Thêm vào màn hình chính (mobile)

### Chia sẻ
- Copy URL và gửi cho người khác
- Chụp màn hình thông tin chi tiết

## ❓ Câu hỏi thường gặp

**Q: Ứng dụng có cần Internet không?**
A: Có, cần Internet để tải dữ liệu và sử dụng Google Maps.

**Q: Tôi có thể sử dụng offline không?**
A: Hiện tại chưa hỗ trợ. Sẽ có trong phiên bản sau.

**Q: Dữ liệu có chính xác không?**
A: Chúng tôi cố gắng cập nhật, nhưng nên gọi điện xác nhận trước khi đến.

**Q: Làm sao báo lỗi thông tin?**
A: Tạo Issue trên GitHub hoặc liên hệ qua email.

**Q: Ứng dụng có thu thập dữ liệu cá nhân không?**
A: Không. Ứng dụng chỉ đọc vị trí khi bạn cho phép, để chỉ đường.

## 🔧 Xử lý sự cố

**Không tải được dữ liệu:**
- Kiểm tra kết nối Internet
- Chạy bằng local server (không mở trực tiếp file HTML)

**Bản đồ không hiển thị:**
- Kiểm tra kết nối Internet
- Thử trình duyệt khác
- Xóa cache trình duyệt

**Chỉ đường không hoạt động:**
- Cho phép truy cập vị trí trong trình duyệt
- Kiểm tra GPS trên điện thoại

## 📞 Hỗ trợ

Nếu cần giúp đỡ:
- Xem file README.md
- Tạo Issue trên GitHub
- Email: your.email@example.com

---

**Chúc bạn sử dụng hiệu quả!** 🎉
