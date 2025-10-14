import 'package:flutter/material.dart';

class ONhapDangNhap extends StatelessWidget {
  const ONhapDangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _xayDungONhap(Icons.email, 'Email'),
        const SizedBox(height: 20),
        _xayDungONhap(Icons.lock, 'Mật khẩu', anVanBan: true),
      ],
    );
  }

  Widget _xayDungONhap(IconData bieuTuong, String goiY, {bool anVanBan = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        obscureText: anVanBan,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(bieuTuong, color: Colors.black),
          hintText: goiY,
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
  