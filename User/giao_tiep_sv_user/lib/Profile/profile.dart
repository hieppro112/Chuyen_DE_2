import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/edit_profile_screen.dart';
import 'package:giao_tiep_sv_user/Profile/personalPost/personal_post_screen.dart';
import 'package:giao_tiep_sv_user/Profile/saveItemsProfile/saved_items_profile_screen.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/member_post_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin avatar + tên
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/d4/38/25/d43825dd483d634e59838d919c3cf393.jpg",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Phạm Thắng",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "Ngành học: ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "CNTT",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Niên khóa: ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "2023",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Thông tin chung
              const Text(
                "Thông tin chung",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),

              ListTile(
                leading: const Icon(Icons.person_outline, color: Colors.blue),
                title: const Text("Chỉnh sửa thông tin"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.article_outlined, color: Colors.blue),
                title: const Text("Bài viết"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalPostScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_border, color: Colors.blue),
                title: const Text("Mục đã lưu"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedItemsProfileScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
              // Liên kết
              const Text(
                "Liên kết",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),

              ListTile(
                leading: const Icon(Icons.language, color: Colors.blue),
                title: const Text("Website trường TDC"),
                onTap: () {
                  // Mở duyệt admin
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const AdminPostApprovalScreen(),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemberPostScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.blue),
                title: const Text("Đăng xuất"),
                onTap: () {
                  // logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
