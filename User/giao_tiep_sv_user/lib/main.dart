import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Home_screen/Home/Home_screen/Group_create/nhom_cua_toi.dart';
import 'package:giao_tiep_sv_user/Home_screen/home.dart';
import 'package:giao_tiep_sv_user/Login_register/dang_ki.dart';
import 'package:giao_tiep_sv_user/Login_register/dang_nhap.dart';
import 'package:giao_tiep_sv_user/Login_register/quen_mk.dart';
import 'package:giao_tiep_sv_user/Screens_chatMember/view/chatMemberScreens.dart';
import 'package:giao_tiep_sv_user/Screens_chatMember/view/chatMessage.dart';
import 'package:giao_tiep_sv_user/ThongBao/ManHinhThongBao.dart';

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
      home: ManHinhThongBao(), // Trang mặc định
    );
  }
}
