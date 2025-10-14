import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/view/Add_member.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/widget/customMember.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:AddMemberScreen(),
    );
  }
}
