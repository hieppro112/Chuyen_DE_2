import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/Users.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';
import 'package:giao_tiep_sv_admin/widget/customMember.dart';
import 'package:giao_tiep_sv_admin/widget/customSearch.dart';

class Screen_uyquyen extends StatefulWidget {
  const Screen_uyquyen({super.key});

  @override
  State<Screen_uyquyen> createState() => _Screen_uyquyenState();
}

class _Screen_uyquyenState extends State<Screen_uyquyen> {
  String selectedKhoa="Tất cả ";
  List<Users> Listsearch = [];
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
    ),Users(
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

  List<Faculty> dsKhoa = [
    Faculty(id: "TT", name_faculty: "Công nghệ thông tin"),
    Faculty(id: "KT", name_faculty: "Kế toán"),
    Faculty(id: "DT", name_faculty: "Điện"),
    Faculty(id: "OT", name_faculty: "Ô tô"),
    Faculty(id: "CK", name_faculty: "Cơ Khí"),
    Faculty(id: "DL", name_faculty: "Du lich"),
    Faculty(id: "DP", name_faculty: "Đông phương học"),
    Faculty(id: "PC", name_faculty: "Bartender"),
    Faculty(id: "TD", name_faculty: "Tự động hóa"),
    Faculty(id: "KS", name_faculty: "khách sạn"),
    Faculty(id: "NA", name_faculty: "Nấu ăn"),
    Faculty(id: "QT", name_faculty: "Quản trị kinh doanh"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Listsearch = ListMember;
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
          "Chọn người ủy quyền",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          children: [Customsearch(), SizedBox(height: 8), search(),
          SizedBox(height: 8,),
          Text("Danh Sách người dùng",style: TextStyle(
            fontSize: 12,
            color: Colors.grey
          ),),
          Expanded(
            child: createListmember(),
          )
          ],
        ),
      ),
    );
  }

  Widget search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        createChoseKhoa(),

        InkWell(
          onTap: () {
            print("xong");
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff55B9F6),
              border: Border.all(color: Colors.grey, width:0.6),
            ),
            child: Row(
              children: [
                Text(
                  "Xong",
                  style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget createChoseKhoa(){
    return PopupMenuButton<String>(
      child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  "Khoa: ${selectedKhoa.toString()}",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
      onSelected: (value) {
        setState(() {
          selectedKhoa = value;
          Listsearch = ListMember.where((element) {
            return element.id_user.toLowerCase().contains(value.toLowerCase());
          },).toList();
        });
        print(value);
      },
      itemBuilder: (context) {
        return dsKhoa.map((e) {
          return PopupMenuItem(
            value: e.id,
            child: Text(e.name_faculty));
            
        },).toList();
    },);
  }

  Widget createListmember(){
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      itemCount: Listsearch.length,
      itemBuilder: (context, index) {
        var value = Listsearch[index];
        return CustommemberWidget(id: value.id_user, url: value.url_avt, fullname: value.fullname);
      },
    );
  }
  
  }
