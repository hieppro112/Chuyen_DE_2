import 'package:flutter/material.dart';
import '../left_panel.dart'; // Đảm bảo đúng đường dẫn

class NhomCuaToi extends StatefulWidget {
  const NhomCuaToi({super.key});

  @override
  State<NhomCuaToi> createState() => _NhomCuaToiState();
}

class _NhomCuaToiState extends State<NhomCuaToi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Dữ liệu mẫu
  final List<Map<String, dynamic>> groups = [
    {"name": "Dev vui vẻ", "image": "assets/images/dev.png"},
    {"name": "Cơ sở dữ liệu", "image": "assets/images/database.png"},
    {"name": "Công nghệ vui vẻ", "image": "assets/images/database.png"},
    {"name": "Lập trình di động", "image": "assets/images/dev.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: LeftPanel(
          onClose: () {
            Navigator.of(context).pop();
          },
          // Tham số cần thiết cho LeftPanel
          onGroupSelected: (_) {},
          isGroupPage: true,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: const Text(
          "Nhóm của tôi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //  Nút Quay lại ở góc phải
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
            onPressed: () {
              // Quay lại màn hình trước
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8), // Thêm khoảng cách ở lề phải
        ],
      ),
      body: Column(
        children: [
          // Danh sách nhóm
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  final group = groups[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black87, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hình ảnh nhóm
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            group["image"],
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Tên nhóm + nút truy cập
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                group["name"],
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Nút truy cập
                              OutlinedButton(
                                onPressed: () {
                                  print('Truy cập nhóm: ${group["name"]}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Đang truy cập nhóm "${group["name"]}"',
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDE9FF),
                                  side: const BorderSide(
                                    color: Color(0xFF1F65DE),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "Truy cập",
                                      style: TextStyle(
                                        color: Color(0xFF1F65DE),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18,
                                      color: Color(0xFF1F65DE),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
