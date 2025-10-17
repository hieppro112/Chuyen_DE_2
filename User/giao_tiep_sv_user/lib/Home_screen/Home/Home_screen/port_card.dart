import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onCommentPressed;
  final VoidCallback onLikePressed;
  final void Function(String value)? onMenuSelected;

  const PostCard({
    super.key,
    required this.post,
    required this.onCommentPressed,
    required this.onLikePressed,
    this.onMenuSelected,
  });

  String _formatDate(String? dateStr) {
    if (dateStr == null) return "Không rõ";
    try {
      final DateTime date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
    } catch (e) {
      return "Không rõ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      post["avatar"] ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTaXZWZglx63-gMfBzslxSUQdqqvCp0QJiOA&s",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post["user"] ?? "Ẩn danh",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Khoa: ${post["group"] ?? "Không rõ"}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        _formatDate(post["date"]),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PopupMenuButton<String>(
                onSelected: onMenuSelected,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: "report", child: Text("Báo cáo")),
                  PopupMenuItem(value: "save", child: Text("Lưu bài viết")),
                ],
                icon: const Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Tiêu đề
          Text(
            post["title"] ?? "Không có tiêu đề",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          // Hình ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              post["image"] ?? "",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error_outline, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Hành động
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${post["likes"] ?? 0} lượt thích  ${post["comments"]?.length ?? 0} bình luận",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: onCommentPressed,
                    child: const Text(
                      "Bình luận",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                  IconButton(
                    onPressed: onLikePressed,
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.redAccent,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
