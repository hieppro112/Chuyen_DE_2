import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class DangBaiDialog extends StatefulWidget {
  const DangBaiDialog({super.key});

  @override
  State<DangBaiDialog> createState() => _DangBaiDialogState();
}

class _DangBaiDialogState extends State<DangBaiDialog> {
  String selectedGroup = 'Khoa CNTT';
  final TextEditingController contentController = TextEditingController();
  File? selectedImage;
  String? selectedFileName;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: "Nhập......",
                  border: InputBorder.none,
                ),
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 16),

            // Icon chọn file / ảnh
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.insert_drive_file, size: 32),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      setState(() {
                        selectedFileName = result.files.single.name;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.image, size: 32),
                  onPressed: () async {
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        selectedImage = File(pickedFile.path);
                      });
                    }
                  },
                ),
                if (selectedFileName != null)
                  Expanded(
                    child: Text(
                      selectedFileName!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),

            if (selectedImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    selectedImage!,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            const SizedBox(height: 16),
            const Text('Chọn nhóm:'),

            DropdownButtonFormField<String>(
              value: selectedGroup,
              items: const [
                DropdownMenuItem(value: 'Khoa CNTT', child: Text('Khoa CNTT')),
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
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Hủy'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý đăng bài ở đây
                    Navigator.pop(context);
                  },
                  child: const Text('Đăng'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
