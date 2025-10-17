import 'package:flutter/material.dart';
import 'Group_create/tham_gia_nhom.dart';
import 'package:giao_tiep_sv_user/Home_screen/home.dart';

class LeftPanel extends StatelessWidget {
  final VoidCallback onClose;
  //  thuộc tính để xác định menu có đang ở trang nhóm hay không
  final bool isGroupPage;

  const LeftPanel({
    super.key,
    required this.onClose,
    this.isGroupPage = false, //  Giá trị mặc định là false
  });

  @override
  Widget build(BuildContext context) {
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

                //  LOGIC ẨN/HIỆN NÚT "Mở rộng" DỰA TRÊN isGroupPage
                if (!isGroupPage)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
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

            // Nút "Trang chủ" có sự kiện điều hướng
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

            const ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Mobile - (Flutter, Kotlin)"),
            ),
            const ListTile(
              leading: Icon(Icons.computer),
              title: Text("Thiết kế đồ họa"),
            ),
            const ListTile(
              leading: Icon(Icons.developer_mode),
              title: Text("DEV - vui vẻ"),
            ),
            const ListTile(leading: Icon(Icons.school), title: Text("CNTT")),
          ],
        ),
      ),
    );
  }
}
