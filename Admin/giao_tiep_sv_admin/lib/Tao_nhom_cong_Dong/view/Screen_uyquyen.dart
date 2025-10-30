import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/Users.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';
import 'package:giao_tiep_sv_admin/Tao_nhom_cong_Dong/widget/customMemberUyquyen.dart';
import 'package:giao_tiep_sv_admin/widget/customSearch.dart';

class Screen_uyquyen extends StatefulWidget {
  final List<Users>? listUyQuyen;
  final ValueChanged<List<String>>? GetList;

  const Screen_uyquyen({super.key, this.listUyQuyen, this.GetList});
  

  @override
  State<Screen_uyquyen> createState() => _Screen_uyquyenState();
}

class _Screen_uyquyenState extends State<Screen_uyquyen> {
  String selectedKhoa="Tất cả";
  List<String> listUyQuyen_out =[];
  List<Users> Listsearch = [];

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
    Listsearch = widget.listUyQuyen!;
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
            widget.GetList?.call(listUyQuyen_out);
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
          Listsearch = widget.listUyQuyen!.where((element) {
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

  //mang hinh uy quyen 

  Widget createListmember(){
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      itemCount: Listsearch.length,
      itemBuilder: (context, index) {
        var value = Listsearch[index];
        return CustommemberUyQuyen(id: value.id_user, url: value.url_avt, fullname: value.fullname,ontap: (value) {
          //print("key = ${value.keys}, value =${value.values} ");
          if(value.values.first==true){
            listUyQuyen_out+=[value.keys.toString()];
          }
          else{
            listUyQuyen_out.removeWhere((element) => element.contains(value.keys.toString()),);
          }
        },);
      },
    );
  }

  //lấy da
  
  }
