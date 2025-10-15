import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/models/profile_model.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/widgets/confirm_button_widget.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/widgets/profile_avatar_widget.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/widgets/profile_text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Sử dụng Model để quản lý dữ liệu
  final ProfileModel _profile = ProfileModel(
    name: "Phạm Thắng",
    email: "23211TT1718@mail.tdc.edu.vn",
    address: "115/16, Hồ Văn Tư, Thủ Đức",
    phone: "0393413787",
    avatarUrl:
        "https://i.pinimg.com/736x/d4/38/25/d43825dd483d634e59838d919c3cf393.jpg",
  );

  // Controllers để liên kết với TextField
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo controllers với dữ liệu từ model
    _nameController = TextEditingController(text: _profile.name);
    _emailController = TextEditingController(text: _profile.email);
    _addressController = TextEditingController(text: _profile.address);
    _phoneController = TextEditingController(text: _profile.phone);
  }

  @override
  void dispose() {
    // Giải phóng bộ nhớ khi không dùng nữa
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSaveProfile() {
    // Cập nhật dữ liệu từ controllers vào model
    final updatedProfile = _profile.copyWith(
      name: _nameController.text,
      email: _emailController.text,
      address: _addressController.text,
      phone: _phoneController.text,
    );

    // TODO: Lưu dữ liệu vào database/API
    print('Profile saved: $updatedProfile');

    // Quay lại màn hình trước
    Navigator.pop(context);
  }

  void _handleChangeAvatar() {
    // TODO: Xử lý chọn ảnh mới
    print('Change avatar pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Avatar widget
              ProfileAvatarWidget(
                avatarUrl: _profile.avatarUrl,
                onCameraPressed: _handleChangeAvatar,
              ),
              const SizedBox(height: 30),

              // Các trường thông tin
              ProfileTextFieldWidget(
                controller: _nameController,
                labelText: "Họ và tên",
                icon: Icons.person_outline,
              ),

              ProfileTextFieldWidget(
                controller: _emailController,
                labelText: "Email",
                icon: Icons.email_outlined,
                isReadOnly: true, // Email có thể không cho sửa
              ),

              ProfileTextFieldWidget(
                controller: _addressController,
                labelText: "Địa chỉ",
                icon: Icons.location_on_outlined,
              ),

              ProfileTextFieldWidget(
                controller: _phoneController,
                labelText: "Số điện thoại",
                icon: Icons.call,
              ),

              const SizedBox(height: 40),

              // Nút xác nhận
              ConfirmButtonWidget(onPressed: _handleSaveProfile),
            ],
          ),
        ),
      ),
    );
  }
}
