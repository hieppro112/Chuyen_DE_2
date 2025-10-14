import 'package:flutter/material.dart';

class GroupInfoDialog extends StatelessWidget {
  final String groupName;
  const GroupInfoDialog({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Thông tin $groupName",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ======= Các tùy chọn chính =======
            _buildOption(context, Icons.check_circle, "Duyệt", Colors.green),
            _buildOption(context, Icons.group, "Thành viên", Colors.blue),
            _buildOption(
              context,
              Icons.search,
              "Tìm kiếm cuộc đối thoại",
              Colors.grey,
            ),
            _buildOption(context, Icons.logout, "Rời nhóm", Colors.red),
            _buildOption(context, Icons.delete, "Xóa chat nhóm", Colors.black),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Đóng"),
        ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context,
    IconData icon,
    String text,
    Color color,
  ) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: color),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Đã chọn: $text")));
      },
    );
  }
}
