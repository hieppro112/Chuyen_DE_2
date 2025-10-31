import 'package:flutter/material.dart';
import 'dang_nhap.dart';

class DangKi extends StatefulWidget {
  const DangKi({super.key});

  @override
  State<DangKi> createState() => _DangKiState();
}

class _DangKiState extends State<DangKi> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  String? nganhHoc;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  // Bảng mã ngành
  final Map<String, String> maNganhMap = {
    "CT": "Công nghệ kỹ thuật cơ điện tử",
    "TD": "Công nghệ kỹ thuật điều khiển và tự động hóa",
    "ET": "Công nghệ kỹ thuật điện tử, truyền thông",
    "EE": "Công nghệ kỹ thuật điện, điện tử",
    "DI": "Điện tử công nghiệp",
    "LD": "Kỹ thuật lắp đặt điện và điều khiển trong công nghiệp",
    "ML": "Kỹ thuật máy lạnh và điều hòa không khí",
    "DC": "Điện công nghiệp",
    "TT": "Công nghệ thông tin",
    "DH": "Thiết kế đồ họa",
    "TM": "Truyền thông và mạng máy tính",
    "CK": "Cơ khí",
    "OT": "Công nghệ kỹ thuật ô tô",
    "DL": "Quản trị dịch vụ du lịch và lữ hành",
    "KS": "Quản trị khách sạn",
    "NH": "Quản trị nhà hàng",
    "LG": "Logistics",
    "ST": "Quản lý siêu thị",
    "KD": "Quản trị kinh doanh",
    "MK": "Marketing",
    "KT": "Kế toán",
    "TC": "Tài chính - Ngân hàng",
    "TA": "Tiếng Anh",
    "TN": "Tiếng Nhật",
    "TQ": "Tiếng Trung",
    "TH": "Tiếng Hàn Quốc",
  };

  // Kiểm tra định dạng email
  void _kiemTraEmail() {
    String email = emailController.text.trim();
    final RegExp pattern = RegExp(
      r'^[0-9]{5}([A-Z]{2})[0-9]{4}@mail\.tdc\.edu\.vn$',
    );

    final match = pattern.firstMatch(email);

    if (match != null) {
      String maNganh = match.group(1)!;
      setState(() {
        nganhHoc = maNganhMap[maNganh] ?? "Không xác định";
      });
    } else {
      setState(() {
        nganhHoc = null;
      });
    }
  }

  // Xử lý đăng ký
  void _dangKy(BuildContext context) {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin!")),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mật khẩu xác nhận không khớp!")),
      );
      return;
    }

    if (nganhHoc == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email không hợp lệ hoặc không thuộc TDC!"),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đăng ký thành công! Vui lòng đăng nhập.")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DangNhap()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 150),
                  const SizedBox(height: 20),

                  const Text(
                    "TẠO TÀI KHOẢN",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  const SizedBox(height: 31),

                  _buildEmailField(),

                  const SizedBox(height: 20),
                  _buildNameField(),
                  const SizedBox(height: 20),
                  _buildPasswordField(),
                  const SizedBox(height: 15),
                  _buildConfirmPasswordField(),
                  const SizedBox(height: 20),

                  _buildRegisterButton(context),
                  const SizedBox(height: 20),

                  _buildLoginLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: emailController,
        onChanged: (_) => _kiemTraEmail(),
        style: const TextStyle(color: Colors.black87),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.black),
          hintText: 'Email sinh viên',
          hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: null,
        style: const TextStyle(color: Colors.black87),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.black),
          hintText: 'Họ và tên',
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: passwordController,
        obscureText: _obscurePassword,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.black),
          hintText: 'Mật khẩu',
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.black54,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: confirmController,
        obscureText: _obscureConfirm,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
          hintText: 'Xác nhận mật khẩu',
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirm ? Icons.visibility_off : Icons.visibility,
              color: Colors.black54,
            ),
            onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F65DE),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () => _dangKy(context),
        child: const Text(
          "Đăng ký",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bạn đã có tài khoản? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DangNhap()),
            );
          },
          child: const Text(
            "Đăng nhập",
            style: TextStyle(
              color: Color(0xFF1F65DE),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
