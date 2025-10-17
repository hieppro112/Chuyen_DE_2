import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Home_screen/Home/Home_screen/Group_create/nhom_cua_toi.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/view/Add_member.dart';
import 'package:giao_tiep_sv_user/ThongBao/ManHinhThongBao.dart';
import 'Home_screen/home.dart'; // import trang Home bạn tạo
import 'Login_register/dang_nhap.dart'; // import trang đăng nhập bạn tạo
import 'Login_register/dang_ki.dart'; // import trang đăng ký bạn tạo

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
      home: NhomCuaToi(), // Trang mặc định
    );
  }
}
