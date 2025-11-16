/**
 * Configuration Example file for Supabase connection
 *
 * HƯỚNG DẪN SỬ DỤNG:
 * 1. Copy file này thành "config.js":
 *    cp config.example.js config.js
 *
 * 2. Mở file config.js và điền thông tin Supabase của bạn
 *
 * 3. Lấy thông tin từ:
 *    - Đăng nhập: https://app.supabase.com
 *    - Chọn project
 *    - Vào Settings > API
 *    - Copy "Project URL" và "anon public" key
 */

const SUPABASE_CONFIG = {
    // Thay YOUR_PROJECT_URL bằng URL project của bạn
    // Ví dụ: https://abcdefghijklmnop.supabase.co
    url: 'YOUR_PROJECT_URL',

    // Thay YOUR_ANON_KEY bằng anon/public key của bạn
    // Ví dụ: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
    anonKey: 'YOUR_ANON_KEY',

    // Table name (không cần thay đổi)
    tableName: 'locations'
};

// Validate configuration
if (SUPABASE_CONFIG.url === 'YOUR_PROJECT_URL' ||
    SUPABASE_CONFIG.anonKey === 'YOUR_ANON_KEY') {
    console.warn('⚠️ Chưa cấu hình Supabase! Vui lòng cập nhật file config.js');
}
