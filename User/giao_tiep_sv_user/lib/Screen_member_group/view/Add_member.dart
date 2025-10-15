import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/widget/customMember.dart';
import 'package:giao_tiep_sv_user/Screen_member_group/widget/customSearch.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  List<CustommemberWidget> Listsearch = [];
  List<CustommemberWidget> ListMember = [
    CustommemberWidget(
      id: 1,
      url: "assets/images/avatar.png",
      fullname: "Le Dai Hiep",
    ),
    CustommemberWidget(
      id: 2,
      url: "assets/images/avatar.png",
      fullname: "Le Dinh Thuan",
    ),
    CustommemberWidget(
      id: 3,
      url: "assets/images/avatar.png",
      fullname: "Cao Quang Khanh",
    ),
    CustommemberWidget(
      id: 4,
      url: "assets/images/avatar.png",
      fullname: "Pham Thang",
    ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customsearch(
              onChanged: (value) {
                Listsearch = ListMember.where((element) {
                  return element.fullname.toLowerCase().contains(
                    value.toLowerCase(),
                  );
                }).toList();
                print("$value");
              },
            ),
            SizedBox(height: 10),
            Text(
              "Kết quả:1",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            create_listMember(),
          ],
        ),
      ),
    );
  }

  Widget create_listMember() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: Listsearch.length,
      itemBuilder: (context, index) {
        var value = Listsearch[index];
        return CustommemberWidget(
          id: value.id,
          url: value.url,
          fullname: value.fullname,
        );
      },
    );
  }
}
