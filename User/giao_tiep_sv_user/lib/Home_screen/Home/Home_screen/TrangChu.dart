import 'package:flutter/material.dart';
import 'port_card.dart';
import 'dang_bai_dialog.dart';
import 'left_panel.dart';
import 'group_info_dialog.dart';
import 'search_page.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  bool _isOpen = false; // trạng thái mở menu trái
  String currentGroup = "Nhóm CNTT"; // 🔹 nhóm hiện tại hiển thị
  List<Map<String, dynamic>> posts = [];

  @override
  void initState() {
    super.initState();

    // 🔹 Tạm dữ liệu mẫu
    posts = List.generate(2, (i) {
      return {
        "user": "Cao Quang Khánh",
        "group": i == 0 ? "Khoa CNTT" : "Dev vui vẻ",
        "title": "Em xin tài liệu tiếng anh như này",
        "image": "https://picsum.photos/seed/${i + 1}/400/200",
        "comments": [
          {"name": "Cao Quang Khánh", "text": "Alo 123"},
          {"name": "Cao Quang Khánh", "text": "Alo 123"},
        ],
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ======= Thanh trên cùng =======
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Nút mở menu trái
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            setState(() => _isOpen = !_isOpen);
                          },
                        ),

                        // Ô tìm kiếm
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.search, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text(
                                    "Tìm kiếm",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Nút đăng bài
                        ElevatedButton(
                          onPressed: _openDangBaiDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text("Đăng bài"),
                        ),
                      ],
                    ),
                  ),

                  // ======= Thông tin nhóm =======
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaXZWZglx63-gMfBzslxSUQdqqvCp0QJiOA&s",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              currentGroup,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  GroupInfoDialog(groupName: currentGroup),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Text(
                      "Bảng tin",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // ======= Danh sách bài viết =======
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      final post = posts[i];
                      return PostCard(
                        post: post,
                        onCommentPressed: () => _showCommentDialog(post),
                        onLikePressed: () {},
                        onMenuSelected: (value) {
                          debugPrint("Đã chọn: $value");
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // ======= Overlay mờ khi mở menu =======
          if (_isOpen)
            GestureDetector(
              onTap: () => setState(() => _isOpen = false),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),

          // ======= Panel menu trái =======
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            left: _isOpen ? 0 : -260,
            child: LeftPanel(onClose: () => setState(() => _isOpen = false)),
          ),
        ],
      ),
    );
  }

  // ======= Mở dialog đăng bài =======
  void _openDangBaiDialog() async {
    await showDialog(context: context, builder: (_) => const DangBaiDialog());
    setState(() {});
  }

  // ======= Dialog bình luận =======
  void _showCommentDialog(Map<String, dynamic> post) {
    TextEditingController commentCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Bình luận"),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: ListView(
                  children: post["comments"].map<Widget>((c) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaXZWZglx63-gMfBzslxSUQdqqvCp0QJiOA&s",
                        ),
                      ),
                      title: Text(c["name"]),
                      subtitle: Text(c["text"]),
                    );
                  }).toList(),
                ),
              ),
              TextField(
                controller: commentCtrl,
                decoration: const InputDecoration(
                  hintText: "Thêm bình luận...",
                  suffixIcon: Icon(Icons.send),
                ),
                onSubmitted: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      post["comments"].add({
                        "name": "Cao Quang Khánh",
                        "text": val,
                      });
                    });
                    commentCtrl.clear();
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Đóng"),
          ),
        ],
      ),
    );
  }
}
