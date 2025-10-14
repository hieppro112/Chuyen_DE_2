import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/widget/customMember.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/widget/customSearch.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Thêm thành viên",
          style: TextStyle(
            color: Color(0xffA72E2E),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            print("Exit");
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Image.asset(
              "assets/icons/ic_back.png",
              fit: BoxFit.contain,
              height: 15,
              width: 15,
            ),
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customsearch(
            onChanged: (value) {
              print("$value");
            },
          ),
          SizedBox(height: 10),
          Text("Kết quả:"
          ,style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize:15 
          ),),
          SizedBox(height: 10),
          CustommemberWidget(
            id: 1,
            url: "assets/images/avatar.png",
            fullname: "LE Dai Hiep",
          ),
        ],
      ),)
    );
  }
}
