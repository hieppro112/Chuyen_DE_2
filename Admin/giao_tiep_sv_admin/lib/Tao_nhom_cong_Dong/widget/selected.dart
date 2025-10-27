import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/Users.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';

class CustomSlected extends StatefulWidget {
  final List<Users> listmember;
  final List<Faculty> listFaculty;
  const CustomSlected({
    super.key,
    required this.listmember,
    required this.listFaculty,
  });

  @override
  State<CustomSlected> createState() => _CustomSlectedState();
}

class _CustomSlectedState extends State<CustomSlected> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [listmemberselec()])
      ,
    );
  }

  Widget listmemberselec() {
    return Wrap(
      spacing: 8,
      runSpacing: 5,
      children: [
        Text(
          "Người được ủy quyền: ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 4),
        ...widget.listmember.map((e) {
          return Text("${e.fullname}, ", style: TextStyle(fontSize: 14));
        }).toList(),
      ],
    );
  }
}
