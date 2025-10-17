import 'package:flutter/material.dart';
import 'Group_create/tham_gia_nhom.dart';
import 'package:giao_tiep_sv_user/Home_screen/home.dart';

class LeftPanel extends StatelessWidget {
  final VoidCallback onClose;
  //  thuộc tính để xác định menu có đang ở trang nhóm hay không
  final bool isGroupPage;
  // 🔹 HÀM GỌI LẠI KHI CHỌN NHÓM
  final void Function(String) onGroupSelected;

  const LeftPanel({
    super.key,
    required this.onClose,
    required this.onGroupSelected, // 🔹 Bắt buộc phải truyền vào
    this.isGroupPage = false, //  Giá trị mặc định là false
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 DANH SÁCH NHÓM CẦN HIỂN THỊ
    const List<Map<String, dynamic>> groups = [
      {"name": "Tất cả", "icon": Icons.public},
      {"name": "Mobile - (Flutter, Kotlin)", "icon": Icons.phone_android},
      {"name": "Thiết kế đồ họa", "icon": Icons.computer},
      {"name": "DEV - vui vẻ", "icon": Icons.developer_mode},
      {"name": "CNTT", "icon": Icons.school},
    ];

    return SafeArea(
      child: Container(
        width: 260,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Nhóm:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),

                //  LOGIC ẨN/HIỆN NÚT "Mở rộng" DỰA TRÊN isGroupPage
                if (!isGroupPage)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // 🔹 Đã sửa lỗi: ThiamGiaNhom() -> const ThamGiaNhomPage()
                          builder: (context) => const ThamGiaNhomPage(),
                        ),
                      );
                      onClose();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Mở rộng", style: TextStyle(color: Colors.black)),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Tìm nhóm...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Nút "Trang chủ"
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Trang chủ"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
                onClose();
              },
            ),
            const Divider(), // Phân cách
            // 🔹 DANH SÁCH CÁC NHÓM
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  final group = groups[index];
                  return ListTile(
                    leading: Icon(group["icon"]),
                    title: Text(group["name"]),
                    onTap: () {
                      // 🔹 GỌI HÀM CALLBACK VÀ TRUYỀN TÊN NHÓM
                      onGroupSelected(group["name"]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
