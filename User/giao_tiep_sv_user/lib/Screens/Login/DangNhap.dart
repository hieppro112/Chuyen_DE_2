import 'package:flutter/material.dart';
import 'PhanDauDangNhap.dart';
import 'ONhapDangNhap.dart';
import 'NutDangNhap.dart';

class Dangnhap extends StatelessWidget {
  const Dangnhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhanDauDangNhap(),
                SizedBox(height: 30),
                ONhapDangNhap(),
                SizedBox(height: 20),
                NutDangNhap(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
