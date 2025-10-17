import 'package:flutter/material.dart';

class HeaderMessage extends StatelessWidget {
  final String fullname;
  final String url_avt;
  const HeaderMessage({super.key, required this.fullname, required this.url_avt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: Colors.grey,
          width: 2
        ))
      ),

      child: createHeader(),
    );
  }

  Widget createHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print("exit");
          },
          child: ClipOval(
            child: Image.asset("assets/icons/ic_back.png",fit: BoxFit.cover,width: 30,height: 30,),
          ),
        ),

        Row(
          children: [
            Text(fullname,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),

      SizedBox(width: 10,),

        InkWell(
          onTap: () {
            print("avatar");
          },
          child: ClipOval(
            child: Image.asset("assets/images/avatar.png",fit: BoxFit.cover,width: 45,height: 45,),
          ),
        ),
          ],
        )
        
      ],
    );
  }
}