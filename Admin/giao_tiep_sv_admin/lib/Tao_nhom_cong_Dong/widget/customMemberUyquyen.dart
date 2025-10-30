import 'package:flutter/material.dart';


class CustommemberUyQuyen extends StatefulWidget {
  final String id;
  final String url;
  final String fullname;
  final ValueChanged<Map<String,bool>>? ontap;
  const CustommemberUyQuyen({
    super.key,
    required this.id,
    required this.url,
    required this.fullname,
    this.ontap,
  });

  @override
  State<CustommemberUyQuyen> createState() => _CustommemberUyQuyen();
}

class _CustommemberUyQuyen extends State<CustommemberUyQuyen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          ischecked = !ischecked;
          widget.ontap?.call({widget.id:ischecked});
        });
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //create img avatar
                ClipOval(
                  child: Image.asset(
                    widget.url,
                    fit: BoxFit.fill,
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(width: 15),
                //name
                Text(
                  widget.fullname,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Checkbox(
              value: ischecked,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  ischecked = value!;
                  widget.ontap?.call({widget.id:ischecked});

                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
