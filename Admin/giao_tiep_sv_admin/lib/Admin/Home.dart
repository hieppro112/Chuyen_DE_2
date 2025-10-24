import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Tao_nhom_cong_Dong/view/Create_group_community.dart';
import 'bao_cao_vi_pham.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Nền trắng như hình
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar nền trắng
        elevation: 0, // Bỏ đổ bóng
        title: const Text(
          'ADMIN',
          style: TextStyle(
            color: Colors.black, // Chữ đen
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Tiêu đề căn giữa
        // Bạn có thể thêm Icon Profile vào đây hoặc trong body
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.person, color: Colors.black, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Căn giữa theo chiều ngang
            children: <Widget>[
              const SizedBox(height: 30), // Khoảng cách giữa avatar và các nút
              // Nút "Báo cáo vi phạm"
              _buildAdminButton(
                context,
                icon: Icons.verified_user_outlined,
                text: 'Báo cáo vi phạm.',
                color: const Color(0xFFFFEBEE),
                iconColor: Colors.green,
                onPressed: () {
                  // Chuyển đến màn hình báo cáo vi phạm
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),

              // Nút "Truy xuất tài khoản member"
              _buildAdminButton(
                context,
                icon: Icons.people_alt, // Icon người dùng
                text: 'Truy xuất tài khoản member',
                color: const Color(0xFFE8F5E9), // Màu xanh lá nhạt
                iconColor: Colors.blue, // Màu icon xanh dương
                onPressed: () {
                  // Xử lý khi nhấn nút
                  print('Truy xuất tài khoản member pressed');
                },
              ),
              const SizedBox(height: 15),

              // Nút "Tạo nhóm cộng đồng"
              _buildAdminButton(
                context,
                icon: Icons.groups, // Icon nhóm
                text: 'Tạo nhóm cộng đồng',
                color: const Color(0xFFE3F2FD), // Màu xanh dương nhạt
                iconColor: Colors.purple, // Màu icon tím
                onPressed: () {
                  // Xử lý khi nhấn nút
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenCommunityGroup(),));
                },
              ),
              const SizedBox(height: 15),

              // Nút "Quản lý bài viết và báo cáo"
              _buildAdminButton(
                context,
                icon: Icons.report_problem, // Icon báo cáo
                text: 'Quản lý bài viết và báo cáo',
                color: const Color(0xFFFFF3E0), // Màu cam nhạt
                iconColor: Colors.red, // Màu icon đỏ
                onPressed: () {
                  // Xử lý khi nhấn nút
                  print('Quản lý bài viết và báo cáo pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tiện ích để tạo các nút quản trị viên
  Widget _buildAdminButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required Color color,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity, // Chiếm toàn bộ chiều rộng có thể
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15), // Bo tròn góc
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2), // Đổ bóng nhẹ
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios, // Icon mũi tên bên phải
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
