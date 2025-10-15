import 'package:flutter/material.dart';

class ThamGiaNhomPage extends StatefulWidget {
  const ThamGiaNhomPage({super.key});

  @override
  State<ThamGiaNhomPage> createState() => _ThamGiaNhomPageState();
}

class _ThamGiaNhomPageState extends State<ThamGiaNhomPage> {
  final List<Map<String, dynamic>> groups = [
    {
      "name": "Mạng máy tính Khóa 23",
      "image": "https://cdn-icons-png.flaticon.com/512/888/888859.png",
    },
    {
      "name": "Giao lưu Java",
      "image": "https://cdn-icons-png.flaticon.com/512/226/226777.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Tham Gia Nhóm",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.group, color: Colors.black),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // TODO: xử lý khi bấm thêm nhóm
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Ảnh nhóm
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        group["image"],
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Tên nhóm và nút tham gia
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            group["name"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Đã gửi yêu cầu tham gia "${group["name"]}"',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(Icons.handshake),
                            label: const Text("Tham Gia"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
