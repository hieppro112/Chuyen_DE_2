import 'package:flutter/material.dart';
import '../Login/DangNhap.dart';

class NutDangKy extends StatelessWidget {
  const NutDangKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
             Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dangnhap()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Đăng ký thành công! Vui lòng đăng nhập."),
                ),
              );
            },
            child: const Text(
              "Đăng ký",
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
              "Bạn đã có tài khoản? ",
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Dangnhap()),
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
        ),
      ],
    );
  }
}
