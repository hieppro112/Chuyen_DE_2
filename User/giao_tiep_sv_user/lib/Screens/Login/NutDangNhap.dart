import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Screens/QuenMatKhau/QuenMk.dart';
import '../Register/DangKy.dart';

class NutDangNhap extends StatelessWidget {
  const NutDangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        SizedBox(
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đăng nhập thành công!')),
              );
            },
            child: const Text(
              "Đăng nhập",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
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
                  MaterialPageRoute(builder: (context) => const Dangky()),
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
        ),
      ],
    );
  }
}
