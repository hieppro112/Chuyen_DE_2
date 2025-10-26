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

  // Hàm chọn ảnh từ thư viện
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        // Khi chọn ảnh, bỏ chọn file nếu có
        selectedFileName = null;
      });
    }
  }

  // Hàm chọn file
  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        // Chỉ lấy tên file, không cần lấy path file cho biến này
        selectedFileName = result.files.single.name;
        // Khi chọn file, bỏ chọn ảnh nếu có
        selectedImage = null;
      });
    }
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Màu chủ đạo cho ứng dụng
    const Color primaryColor = Color(0xFF1E88E5); // Màu xanh dương đậm hơn

    return Dialog(
      // Thay đổi padding và margin để trông gọn gàng hơn
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        // Thêm SingleChildScrollView để tránh tràn màn hình
        child: Container(
          width: 500, // Đảm bảo kích thước tối đa vẫn giữ nguyên
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white, // Nền trắng sạch sẽ
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              // Thêm shadow nhẹ cho dialog
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Đăng Bài Viết Mới',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 33, 37, 41),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(height: 25, thickness: 1, color: Colors.grey),

              // Ô nhập nội dung
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50, // Nền nhập liệu màu nhạt
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: "Bạn đang nghĩ gì? Chia sẻ ngay...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  maxLines: 6,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const SizedBox(height: 20),

              // Khu vực đính kèm (File / Ảnh)
              const Text(
                'Đính kèm:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    // Icon chọn file
                    Tooltip(
                      message: 'Đính kèm tệp tin',
                      child: IconButton(
                        icon: const Icon(
                          Icons.attach_file,
                          size: 28,
                          color: primaryColor,
                        ),
                        onPressed: _pickFile,
                      ),
                    ),
                    // Icon chọn ảnh
                    Tooltip(
                      message: 'Tải ảnh từ thư viện',
                      child: IconButton(
                        icon: const Icon(
                          Icons.image_outlined,
                          size: 28,
                          color: primaryColor,
                        ),
                        onPressed: _pickImage,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Hiển thị tên file hoặc ảnh
                    Expanded(
                      child: Text(
                        selectedFileName ??
                            (selectedImage != null
                                ? selectedImage!.path
                                      .split('/')
                                      .last // Hiển thị tên file ảnh
                                : 'Chưa có tệp nào được chọn'),
                        style: TextStyle(
                          color:
                              selectedFileName != null || selectedImage != null
                              ? Colors.black87
                              : Colors.grey,
                          fontStyle:
                              selectedFileName == null && selectedImage == null
                              ? FontStyle.italic
                              : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Nút xóa đính kèm chung
                    if (selectedFileName != null || selectedImage != null)
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedFileName = null;
                            selectedImage = null;
                          });
                        },
                      ),
                  ],
                ),
              ),

              // Hiển thị ảnh đã chọn (Preview)
              if (selectedImage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      selectedImage!,
                      height: 150,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // Chọn nhóm (Dropdown)
              const Text(
                'Chọn nhóm:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryColor, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 30),

              // Nút hành động
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade700,
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Hủy', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          primaryColor, // Nút Đăng dùng màu chủ đạo
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      // Xử lý đăng bài ở đây
                      // final postData = {
                      //   'content': contentController.text,
                      //   'group': selectedGroup,
                      //   'image_file': selectedImage,
                      //   'other_file': selectedFileName,
                      // };

                      // print(postData);

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Đăng Bài',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
