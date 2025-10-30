import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/Users.dart';
import 'package:giao_tiep_sv_admin/Tao_nhom_cong_Dong/view/Screen_uyquyen.dart';
import 'package:giao_tiep_sv_admin/Tao_nhom_cong_Dong/widget/custom_all_khoa.dart';
import 'package:giao_tiep_sv_admin/Tao_nhom_cong_Dong/widget/selected.dart';
import 'package:giao_tiep_sv_admin/widget/MyButton.dart';
import 'package:image_picker/image_picker.dart';

class ScreenCommunityGroup extends StatefulWidget {
  const ScreenCommunityGroup({super.key});

  @override
  State<ScreenCommunityGroup> createState() => _ScreenCommunityGroupState();
}

class _ScreenCommunityGroupState extends State<ScreenCommunityGroup> {
  File? avt_group = null;
  List<String> khoa = ["CNTT", "Kế Toán", "Điện", "Ô Tô", "Cơ khí"];
  TextEditingController nameGroup = TextEditingController();
  TextEditingController descriptionGroup = TextEditingController();
  List<String> listSelected_uyquyen = [];

  List<Users> ListMember = [
    Users(
      id_user: "23211TT3598@mail.tdc.edu.vn",
      email: "23211TT3598@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Đại Hiệp",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3599@mail.tdc.edu.vn",
      email: "23211TT3599@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Đình Thuận",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3597@mail.tdc.edu.vn",
      email: "23211TT3597@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Cao Quang Khánh",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 0,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3596@mail.tdc.edu.vn",
      email: "23211TT3596@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Phạm Thắng",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 0,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),

    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211TT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211KS3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211QT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211PC3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Lê Van Tủn",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
    Users(
      id_user: "23211KT3595@mail.tdc.edu.vn",
      email: "23211TT3595@mail.tdc.edu.vn",
      pass: "123456",
      fullname: "Anh Thu",
      phone: "0898415185",
      url_avt: "assets/images/avatar.png",
      role: 1,
      faculty_id: 1,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 25,
        ),
        title: Text(
          "Tạo nhóm cộng đồng",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createNameGroup(),
            SizedBox(height: 10),
            createDescription(),
            SizedBox(height: 10),
            create_avt(),
            SizedBox(height: 10),
            createButton(),
            SizedBox(height: 15),
            CustomSlected(listmember: listSelected_uyquyen, listFaculty: []),
            SizedBox(height: 30),
            complate_create(),
          ],
        ),
      ),
    );
  }

  Widget complate_create() {
    return InkWell(
       onTap: () async{
          ScaffoldMessenger.of(context).showSnackBar(
            await const SnackBar(
              content: Text('Đã tạo nhóm thành công !'),
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.pop(context);
        },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xff55B9F6),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 0.9),
          ),
          child: Text(
            "Tạo nhóm",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget createButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Mybutton(
          url_icon: 'assets/images/admin.png',
          nameButton: "Ủy quyền",
          Mycolor: Colors.white,
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Screen_uyquyen(
                listUyQuyen: ListMember,
                GetList: (value) {
                  setState(() {
                    listSelected_uyquyen = value;
                  });
                },
              ),
            ),
          ),
        ),
        Mybutton(
          url_icon: 'assets/images/group.png',
          nameButton: "Khoa",
          Mycolor: Colors.white,
          ontap: () {
            print("chon khoa");
            CustomAllKhoa.show(context);
          },
        ),
      ],
    );
  }

  Widget createNameGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tên Nhóm:", style: TextStyle(fontSize: 25)),
        SizedBox(height: 5),
        TextField(
          controller: nameGroup,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            ),
            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget createDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mô Tả:", style: TextStyle(fontSize: 25)),
        SizedBox(height: 5),
        TextField(
          textAlignVertical: TextAlignVertical.top,
          minLines: 3,
          maxLines: 5,
          controller: descriptionGroup,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget create_avt() {
    return Row(
      children: [
        Expanded(
          child: Text("Chọn ảnh đại diện:", style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              print("pick img");
              final ImagePicker pickerImg = ImagePicker();
              final XFile? image = await pickerImg.pickImage(
                source: ImageSource.gallery,
              );
              if (image != null) {
                setState(() {
                  avt_group = File(image.path);
                });
              }
            },
            child: (avt_group == null)
                ? Image.asset(
                    'assets/images/picked_avt_group.png',
                    width: 100,

                    height: 100,
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    // avt_group.path?'assets/images/picked_avt_group.png',
                    avt_group!,
                    fit: BoxFit.contain,
                    width: 45,
                    height: 45,
                  ),
          ),
        ),
      ],
    );
  }
}
