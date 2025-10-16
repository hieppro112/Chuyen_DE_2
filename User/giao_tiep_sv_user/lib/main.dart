import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/view/Add_member.dart';
import 'package:giao_tiep_sv_user/maneger_member_group_Screens/view/maneger_member_group.dart';
import 'Home_screen/home.dart'; // import trang Home bạn tạo

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
<<<<<<< HEAD
      home: ManegerMemberGroupScreen(), // Trang mặc định
=======
      home: Home(), // Trang mặc định
>>>>>>> c9651bd11b4d493aabdd113e90a842e811df8199
    );
  }
}

