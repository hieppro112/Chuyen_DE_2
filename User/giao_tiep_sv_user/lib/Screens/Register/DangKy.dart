import 'package:flutter/material.dart';
import 'PhanDauDangKy.dart';
import 'ONhapDangKy.dart';
import 'NutDangKy.dart';

class Dangky extends StatelessWidget {
  const Dangky({super.key});

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
                PhanDauDangKy(),
                SizedBox(height: 30),
                ONhapDangKy(),
                SizedBox(height: 20),
                NutDangKy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
