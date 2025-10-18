import 'package:flutter/material.dart';
import '../models/personal_post_model.dart';

class PersonalPostItemWidget extends StatefulWidget {
  final PersonalPostModel post;
  final VoidCallback onComment;
  final VoidCallback onLike;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;

  const PersonalPostItemWidget({
    super.key,
    required this.post,
    required this.onComment,
    required this.onLike,
    required this.onDelete,
    this.onEdit,
  });

  @override
  State<PersonalPostItemWidget> createState() => _PersonalPostItemWidgetState();
}

class _PersonalPostItemWidgetState extends State<PersonalPostItemWidget> {
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.isLiked;
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc muốn xóa bài viết này?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop();
              },
              child: const Text('Xóa', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header với thông tin người đăng và menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(widget.post.image),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Khoa: ${widget.post.faculty}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          _formatDate(widget.post.createdAt),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      _showDeleteConfirmation(context);
                    } else if (value == 'edit' && widget.onEdit != null) {
                      widget.onEdit!();
                    }
                  },
                  itemBuilder:
                      (context) => [
                        if (widget.onEdit != null)
                          const PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 18),
                                SizedBox(width: 8),
                                Text('Chỉnh sửa'),
                              ],
                            ),
                          ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                size: 18,
                                color: Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text('Xóa', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Tiêu đề bài viết
            Text(
              widget.post.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            // Ảnh minh họa
            if (widget.post.image.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.post.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Không thể tải ảnh'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Thống kê và hành động
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Thống kê
                Row(
                  children: [
                    Text(
                      '${widget.post.likesCount} lượt thích',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${widget.post.commentsCount} bình luận',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                // Nút hành động
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      onPressed: widget.onComment,
                      child: const Text("Bình luận"),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                        widget.onLike();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
