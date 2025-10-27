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

  // Thay đổi: Sử dụng List để lưu nhiều File ảnh
  List<File> selectedImages = [];

  // Thay đổi: Sử dụng List để lưu tên nhiều File tài liệu
  List<String> selectedFileNames = [];

  final ImagePicker _picker = ImagePicker();

  // Hàm chọn nhiều ảnh từ thư viện
  Future<void> _pickImages() async {
    // Cho phép chọn nhiều ảnh
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      setState(() {
        // Chuyển đổi XFile sang File và thêm vào danh sách
        selectedImages.addAll(
          pickedFiles.map((xfile) => File(xfile.path)).toList(),
        );
        // Khi chọn ảnh, xóa danh sách file tài liệu
        selectedFileNames.clear();
      });
    }
  }

  // Hàm chọn nhiều file tài liệu
  Future<void> _pickFiles() async {
    // Cho phép chọn nhiều file tài liệu
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        // Lấy tên các file và thêm vào danh sách
        selectedFileNames.addAll(
          result.files.map((platformFile) => platformFile.name).toList(),
        );
        // Khi chọn file tài liệu, xóa danh sách ảnh
        selectedImages.clear();
      });
    }
  }

  // Hàm xóa một file tài liệu khỏi danh sách
  void _removeFile(int index) {
    setState(() {
      selectedFileNames.removeAt(index);
    });
  }

  // Hàm xóa một ảnh khỏi danh sách
  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1E88E5);

    // Kiểm tra xem có bất kỳ file hay ảnh nào được chọn không
    final hasAttachments =
        selectedImages.isNotEmpty || selectedFileNames.isNotEmpty;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
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
                  color: Colors.grey.shade50,
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

              // Khu vực chọn và hiển thị đính kèm
              const Text(
                'Đính kèm:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              // Hàng Icon chọn File/Ảnh
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
                      message: 'Đính kèm tệp tin (nhiều file)',
                      child: IconButton(
                        icon: const Icon(
                          Icons.attach_file,
                          size: 28,
                          color: primaryColor,
                        ),
                        onPressed: _pickFiles,
                      ),
                    ),
                    // Icon chọn ảnh
                    Tooltip(
                      message: 'Tải ảnh từ thư viện (nhiều ảnh)',
                      child: IconButton(
                        icon: const Icon(
                          Icons.image_outlined,
                          size: 28,
                          color: primaryColor,
                        ),
                        onPressed: _pickImages,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Thông báo trạng thái đính kèm
                    Expanded(
                      child: Text(
                        hasAttachments
                            ? 'Đã đính kèm ${selectedImages.length + selectedFileNames.length} tệp'
                            : 'Chưa có tệp nào được chọn',
                        style: TextStyle(
                          color: hasAttachments ? Colors.black87 : Colors.grey,
                          fontStyle: hasAttachments ? null : FontStyle.italic,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // Hiển thị danh sách file tài liệu đã chọn
              if (selectedFileNames.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: selectedFileNames.asMap().entries.map((entry) {
                      int index = entry.key;
                      String fileName = entry.value;
                      return Chip(
                        avatar: const Icon(Icons.insert_drive_file, size: 18),
                        label: Text(
                          fileName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () => _removeFile(index),
                        backgroundColor: Colors.blue.shade50,
                      );
                    }).toList(),
                  ),
                ),

              // Hiển thị preview nhiều ảnh đã chọn
              if (selectedImages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 4 ảnh trên 1 hàng
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                    itemCount: selectedImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GridTile(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.file(
                                selectedImages[index],
                                fit: BoxFit.cover,
                              ),
                              // Nút xóa ảnh
                              Positioned(
                                top: 4,
                                right: 4,
                                child: InkWell(
                                  onTap: () => _removeImage(index),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                      backgroundColor: primaryColor,
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
                      // Lưu ý!: Xử lý đăng bài ở đây
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
