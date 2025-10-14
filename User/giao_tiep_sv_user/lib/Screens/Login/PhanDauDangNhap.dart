import 'package:flutter/material.dart';

class PhanDauDangNhap extends StatelessWidget {
  const PhanDauDangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
