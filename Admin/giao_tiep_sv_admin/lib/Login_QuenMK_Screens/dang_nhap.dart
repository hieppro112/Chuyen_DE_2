import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Login_QuenMK_Screens/quen_mk.dart';
import 'package:giao_tiep_sv_admin/Admin/Home.dart';

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

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
                  const SizedBox(height: 24),
                  const Text(
                    'ĐĂNG NHẬP ADMIN',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.black54),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.black54),
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Xử lý khi nhấn nút
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuenMatKhau(),
                            ),
                          );
                        },
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F65DE), // xanh nước biển
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminScreen(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Đăng nhập thành công!'),
                          ),
                        );
                      },
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.white, // chữ trắng
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
