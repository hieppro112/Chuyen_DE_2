import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Login_QuenMK_Screens/dang_nhap.dart';
import 'package:giao_tiep_sv_admin/Login_QuenMK_Screens/quen_mk.dart';
import 'package:giao_tiep_sv_admin/Truy_Xuat_TK_Screens/truy_xuat_tai_Khoan.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ẩn banner debug
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AdminScreen(), // Trang mặc định
    );
  }
}
