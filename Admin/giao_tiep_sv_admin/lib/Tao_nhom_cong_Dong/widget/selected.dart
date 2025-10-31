import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';

class CustomSlected extends StatefulWidget {
  final int Throws;
  final List<String> listmember;
  final List<Faculty> listFaculty;
  const CustomSlected({
    super.key,
    required this.listmember,
    required this.listFaculty, required this.Throws,
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
          (widget.Throws==1)?"Người được ủy quyền: ":"Người được gửi: ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 4),
        ...widget.listmember.map((e) {
          return Text("${e}, ", style: TextStyle(fontSize: 14));
        }).toList(),
      ],
    );
  }
}
