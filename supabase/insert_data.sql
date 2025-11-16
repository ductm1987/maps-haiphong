-- =====================================================
-- Insert Initial Data for Hải Phòng Administrative Lookup
-- =====================================================

-- Clear existing data (optional - remove if you want to keep existing data)
-- TRUNCATE TABLE locations;

-- Insert all locations
INSERT INTO locations (id, name, category, district, address, phone, working_hours, latitude, longitude, services, notes) VALUES

-- Cơ quan cấp thành phố
('ubnd-hp', 'UBND Thành phố Hải Phòng', 'Cơ quan thành phố', 'Hồng Bàng',
'Số 86 Đinh Tiên Hoàng, Phường Hoàng Văn Thụ, Quận Hồng Bàng, Thành phố Hải Phòng',
'0225.3842.345', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8570, 106.6830,
'["Giải quyết thủ tục hành chính cấp thành phố", "Tiếp công dân", "Giải quyết khiếu nại tố cáo"]'::jsonb,
'Trụ sở chính của UBND Thành phố'),

-- UBND các Quận/Huyện
('ubnd-hong-bang', 'UBND Quận Hồng Bàng', 'Quận/Huyện', 'Hồng Bàng',
'Số 68 Phan Bội Châu, Phường Trại Cau, Quận Hồng Bàng, Thành phố Hải Phòng',
'0225.3831.526', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8663, 106.6771,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
'Trụ sở mới sau sát nhập'),

('ubnd-le-chan', 'UBND Quận Lê Chân', 'Quận/Huyện', 'Lê Chân',
'Số 69 Văn Cao, Phường Đằng Giang, Quận Lê Chân, Thành phố Hải Phòng',
'0225.3740.891', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8374, 106.7016,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
''),

('ubnd-ngo-quyen', 'UBND Quận Ngô Quyền', 'Quận/Huyện', 'Ngô Quyền',
'Số 36 Lạch Tray, Phường Đông Khê, Quận Ngô Quyền, Thành phố Hải Phòng',
'0225.3831.929', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8531, 106.7069,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
''),

('ubnd-hai-an', 'UBND Quận Hải An', 'Quận/Huyện', 'Hải An',
'Số 2 Lê Thánh Tông, Phường Đông Hải 1, Quận Hải An, Thành phố Hải Phòng',
'0225.3861.527', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8421, 106.7324,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
'Quận mới thành lập sau sát nhập'),

('ubnd-kien-an', 'UBND Quận Kiến An', 'Quận/Huyện', 'Kiến An',
'Số 5 Trần Phú, Phường Trần Thành Ngọ, Quận Kiến An, Thành phố Hải Phòng',
'0225.3861.041', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8065, 106.6596,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
''),

('ubnd-do-son', 'UBND Quận Đồ Sơn', 'Quận/Huyện', 'Đồ Sơn',
'Số 8 Nguyễn Văn Linh, Phường Vạn Hương, Quận Đồ Sơn, Thành phố Hải Phòng',
'0225.3861.302', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7158, 106.7914,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
'Khu vực du lịch biển'),

('ubnd-duong-kinh', 'UBND Quận Dương Kinh', 'Quận/Huyện', 'Dương Kinh',
'Số 1 Nguyễn Bỉnh Khiêm, Phường Anh Dũng, Quận Dương Kinh, Thành phố Hải Phòng',
'0225.3861.715', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7789, 106.6245,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp quận"]'::jsonb,
'Quận mới được thành lập'),

('ubnd-an-duong', 'UBND Huyện An Dương', 'Quận/Huyện', 'An Dương',
'Thị trấn An Dương, Huyện An Dương, Thành phố Hải Phòng',
'0225.3877.316', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8901, 106.5854,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
''),

('ubnd-an-lao', 'UBND Huyện An Lão', 'Quận/Huyện', 'An Lão',
'Thị trấn An Lão, Huyện An Lão, Thành phố Hải Phòng',
'0225.3875.315', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8651, 106.5334,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
''),

('ubnd-kien-thuy', 'UBND Huyện Kiến Thụy', 'Quận/Huyện', 'Kiến Thụy',
'Thị trấn Núi Đèo, Huyện Kiến Thụy, Thành phố Hải Phòng',
'0225.3878.317', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7234, 106.6398,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
''),

('ubnd-tien-lang', 'UBND Huyện Tiên Lãng', 'Quận/Huyện', 'Tiên Lãng',
'Thị trấn Tiên Lãng, Huyện Tiên Lãng, Thành phố Hải Phòng',
'0225.3879.318', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7567, 106.5901,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
''),

('ubnd-vinh-bao', 'UBND Huyện Vĩnh Bảo', 'Quận/Huyện', 'Vĩnh Bảo',
'Thị trấn Vĩnh Bảo, Huyện Vĩnh Bảo, Thành phố Hải Phòng',
'0225.3880.319', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7345, 106.5123,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
'Huyện có diện tích lớn nhất Hải Phòng'),

('ubnd-cat-hai', 'UBND Huyện Cát Hải', 'Quận/Huyện', 'Cát Hải',
'Thị trấn Cát Hải, Huyện Cát Hải, Thành phố Hải Phòng',
'0225.3888.320', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.7289, 107.0456,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
'Huyện đảo, có phà qua lại'),

('ubnd-bach-long-vi', 'UBND Huyện Bạch Long Vĩ', 'Quận/Huyện', 'Bạch Long Vĩ',
'Huyện đảo Bạch Long Vĩ, Thành phố Hải Phòng',
'0225.3889.321', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.1333, 107.7167,
'["Cấp giấy khai sinh, khai tử", "Đăng ký kết hôn", "Cấp hộ khẩu", "Giải quyết TTHC cấp huyện"]'::jsonb,
'Huyện đảo xa bờ, chỉ đến được bằng tàu'),

-- Sở ngành
('so-giao-duc', 'Sở Giáo dục và Đào tạo Hải Phòng', 'Sở ngành', 'Hồng Bàng',
'Số 76 Tô Hiệu, Phường Trại Cau, Quận Hồng Bàng, Thành phố Hải Phòng',
'0225.3842.291', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8641, 106.6789,
'["Chuyển trường liên quận/huyện", "Công nhận tốt nghiệp", "Cấp bằng tốt nghiệp"]'::jsonb,
'Trụ sở mới sau sát nhập'),

('so-y-te', 'Sở Y tế Hải Phòng', 'Sở ngành', 'Lê Chân',
'Số 21 Lý Thường Kiệt, Phường Cát Dài, Quận Lê Chân, Thành phố Hải Phòng',
'0225.3822.072', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8456, 106.6934,
'["Cấp phép hành nghề y", "Giấy chứng nhận an toàn thực phẩm", "Thủ tục y tế"]'::jsonb,
''),

('so-cong-an', 'Công an Thành phố Hải Phòng', 'Sở ngành', 'Ngô Quyền',
'Số 10 Hoàng Diệu, Phường Máy Chai, Quận Ngô Quyền, Thành phố Hải Phòng',
'0225.3822.113', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8589, 106.6923,
'["Cấp CCCD", "Cấp/gia hạn hộ chiếu", "Đăng ký tạm trú/tạm vắng"]'::jsonb,
'Trụ sở Công an thành phố'),

('so-tai-nguyen', 'Sở Tài nguyên và Môi trường Hải Phòng', 'Sở ngành', 'Hồng Bàng',
'Số 12 Nguyễn Tri Phương, Phường Hoàng Văn Thụ, Quận Hồng Bàng, Thành phố Hải Phòng',
'0225.3831.245', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00',
20.8583, 106.6812,
'["Cấp sổ đỏ", "Sang tên đổi chủ", "Thủ tục đất đai"]'::jsonb,
'Trụ sở mới sau sát nhập'),

-- Trung tâm hành chính
('trung-tam-hanh-chinh', 'Trung tâm Hành chính công Hải Phòng', 'Trung tâm hành chính', 'Hồng Bàng',
'Số 20 Trần Nguyên Hãn, Phường Hoàng Văn Thụ, Quận Hồng Bàng, Thành phố Hải Phòng',
'0225.3842.999', 'Thứ 2 - Thứ 6: 7:30 - 11:30, 13:30 - 17:00; Thứ 7: 7:30 - 11:30',
20.8593, 106.6845,
'["Tiếp nhận hồ sơ tất cả các sở ngành", "Trả kết quả TTHC", "Tư vấn thủ tục hành chính"]'::jsonb,
'Trung tâm một cửa tập trung, làm việc cả thứ 7')

ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    category = EXCLUDED.category,
    district = EXCLUDED.district,
    address = EXCLUDED.address,
    phone = EXCLUDED.phone,
    working_hours = EXCLUDED.working_hours,
    latitude = EXCLUDED.latitude,
    longitude = EXCLUDED.longitude,
    services = EXCLUDED.services,
    notes = EXCLUDED.notes,
    updated_at = NOW();

-- Verify insertion
SELECT COUNT(*) as total_locations FROM locations;
