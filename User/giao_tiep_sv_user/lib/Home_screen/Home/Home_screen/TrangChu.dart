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

    //  Tạm dữ liệu mẫu
    posts = List.generate(2, (i) {
      return {
        "user": "Cao Quang Khánh",
        "group": i == 0 ? "Khoa CNTT" : "Dev vui vẻ",
        "title": "Em xin tài liệu tiếng anh như này",
        "image": "https://picsum.photos/seed/${i + 1}/400/200",
        "comments": [
          {
            "name": "Nguyễn Văn A",
            "text": "Bạn thử tìm trên trang web của trường xem sao.",
          },
          {
            "name": "Lê Thị B",
            "text": "Mình có một số tài liệu, bạn gửi email cho mình nhé.",
          },
          {
            "name": "Trần Văn C",
            "text": "Alo 123, tài liệu này cũ rồi bạn ơi!",
          },
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
                              child: const Row(
                                children: [
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
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Text(
                      "Bảng tin",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(height: 1),

                  // ======= Danh sách bài viết =======
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      final post = posts[i];
                      return PostCard(
                        post: post,
                        // Thay thế dialog cũ bằng showModalBottomSheet mới
                        onCommentPressed: () => _showCommentSheet(post),
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

          //  Overlay mờ khi mở menu
          if (_isOpen)
            GestureDetector(
              onTap: () => setState(() => _isOpen = false),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),

          // Panel menu trái
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

  // Mở dialog đăng bài
  void _openDangBaiDialog() async {
    await showDialog(context: context, builder: (_) => const DangBaiDialog());
    setState(() {});
  }

  //Hàm hiển thị BOTTOM SHEET BÌNH LUẬN MỚI
  void _showCommentSheet(Map<String, dynamic> post) {
    TextEditingController commentCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Cho phép sheet chiếm gần hết màn hình
      useSafeArea: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final double screenHeight = MediaQuery.of(context).size.height;
            // Chiều cao tối đa của bottom sheet (ví dụ: 90% màn hình)
            final double sheetHeight = screenHeight * 0.85;

            // Chia thành 3 phần: (1) Bài đăng tóm tắt, (2) Danh sách bình luận, (3) Ô nhập liệu
            return Container(
              height: sheetHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  // Thanh kéo và Tiêu đề
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Bình luận",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // 1. Bài đăng tóm tắt (Giống như trên Facebook)
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaXZWZglx63-gMfBzslxSUQdqqvCp0QJiOA&s",
                      ),
                    ),
                    title: Text(
                      post["user"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      post["title"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "trong ${post["group"]}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const Divider(height: 1),

                  // 2. Danh sách Bình luận
                  Expanded(
                    child: ListView.builder(
                      itemCount: post["comments"].length,
                      itemBuilder: (context, index) {
                        final comment = post["comments"][index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaXZWZglx63-gMfBzslxSUQdqqvCp0QJiOA&s",
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment["name"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        comment["text"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // 3. Ô nhập liệu Bình luận (luôn ở dưới cùng)
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 8,
                      // Đẩy thanh nhập liệu lên trên bàn phím ảo
                      bottom: MediaQuery.of(context).viewInsets.bottom + 8,
                    ),
                    child: TextField(
                      controller: commentCtrl,
                      decoration: InputDecoration(
                        hintText: "Viết bình luận...",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send, color: Colors.blue),
                          onPressed: () {
                            String val = commentCtrl.text.trim();
                            if (val.isNotEmpty) {
                              // 1. Cập nhật dữ liệu tạm thời
                              setModalState(() {
                                post["comments"].add({
                                  "name":
                                      "Cao Quang Khánh", // Giả định là user hiện tại
                                  "text": val,
                                });
                              });
                              //  Cập nhật giao diện trang chủ (để đếm bình luận)
                              this.setState(() {});

                              commentCtrl.clear();
                              FocusScope.of(context).unfocus(); // Đóng bàn phím
                            }
                          },
                        ),
                      ),
                      onSubmitted: (val) {},
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
