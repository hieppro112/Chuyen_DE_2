import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String faculty;
  final String academicYear;
  final int postCount;

  const ProfileHeaderWidget({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.faculty,
    required this.academicYear,
    required this.postCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(radius: 35, backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildInfoItem("Ngành học: ", faculty),
                      const SizedBox(width: 20),
                      _buildInfoItem("Niên khóa: ", academicYear),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$postCount bài viết",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
