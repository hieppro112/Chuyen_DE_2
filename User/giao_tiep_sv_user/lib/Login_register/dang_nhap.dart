import 'package:flutter/material.dart';
import 'dang_ki.dart';
import 'quen_mk.dart';
import 'package:giao_tiep_sv_user/Home_screen/home.dart';

class DangNhap extends StatefulWidget {
  const DangNhap({super.key});

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _dangNhap(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
      );
      return;
    }

    
    if (!RegExp(
            r'^[0-9]{5}([A-Z]{2})[0-9]{4}@mail\.tdc\.edu\.vn$')
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email không hợp lệ!")),
      );
      return;
    }

    // Nếu hợp lệ -> điều hướng vào Home
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đăng nhập thành công!')),
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
                    "ĐĂNG NHẬP",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  const SizedBox(height: 30),

                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildPasswordField(),
                  const SizedBox(height: 10),

                  _buildForgotPassword(context),
                  const SizedBox(height: 10),

                  _buildLoginButton(context),
                  const SizedBox(height: 20),

                  _buildRegisterLink(context),
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
        controller: _emailController,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.black),
          hintText: 'Email sinh viên',
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
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black54,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          hintText: 'Mật khẩu',
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuenMatKhau()),
            );
          },
          child: const Text(
            "Quên mật khẩu?",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F65DE),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () => _dangNhap(context),
        child: const Text(
          "Đăng nhập",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bạn chưa có tài khoản? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DangKi()),
            );
          },
          child: const Text(
            "Đăng ký",
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
