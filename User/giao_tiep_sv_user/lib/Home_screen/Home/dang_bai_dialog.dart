import 'package:flutter/material.dart';

class DangBaiDialog extends StatelessWidget {
  const DangBaiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedGroup = 'Khoa CNTT';
    final TextEditingController contentController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Đăng Bài Viết Mới',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Ô nhập nội dung
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      hintText: "Nhập......",
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 14),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                const SizedBox(height: 16),

                // Icon chọn file / ảnh
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.insert_drive_file, size: 32),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.image, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Dropdown chọn nhóm
                const Text('Chọn nhóm:'),
                SizedBox(
                  width: 160,
                  child: DropdownButtonFormField<String>(
                    value: selectedGroup,
                    items: const [
                      DropdownMenuItem(
                        value: 'Khoa CNTT',
                        child: Text('Khoa CNTT'),
                      ),
                      DropdownMenuItem(
                        value: 'DEV vui vẻ',
                        child: Text('DEV vui vẻ'),
                      ),
                      DropdownMenuItem(
                        value: 'Thiết kế đồ họa',
                        child: Text('Thiết kế đồ họa'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) setState(() => selectedGroup = value);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6, // giảm chiều cao
                      ),
                      border: OutlineInputBorder(),
                      isDense: true, // thu nhỏ thêm
                    ),
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ), // chữ nhỏ hơn chút
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12, // giảm 1 nửa
                          vertical: 6, // giảm 1 nửa
                        ),
                      ),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder:
                              (ctx) => AlertDialog(
                                title: const Text('Xác nhận hủy'),
                                content: const Text(
                                  'Bạn có muốn hủy bài đăng không?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(ctx).pop(false),
                                    child: const Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(ctx).pop(true),
                                    child: const Text('Có'),
                                  ),
                                ],
                              ),
                        );
                        if (confirm == true) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        'Hủy',
                        style: TextStyle(fontSize: 13), // nhỏ hơn
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16, // giảm 1 nửa
                          vertical: 6, // giảm 1 nửa
                        ),
                      ),
                      onPressed: () {
                        // TODO: Xử lý đăng bài (contentController.text, selectedGroup)
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Đăng',
                        style: TextStyle(fontSize: 13), // nhỏ hơn
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
