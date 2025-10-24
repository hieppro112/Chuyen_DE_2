import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';

class CustomAllKhoa extends StatefulWidget {
  // final List listKhoa;
  final ValueChanged<bool>? selected;
  const CustomAllKhoa({super.key, this.selected});

  static Future<void> show(BuildContext context) async {
    await showDialog(context: context, builder: (context) => CustomAllKhoa());
  }

  @override
  State<CustomAllKhoa> createState() => CustomAllKhoaState();
}

class CustomAllKhoaState extends State<CustomAllKhoa> {
  Map<String, bool> ListSelected = {};
  List<Faculty> dsKhoa = [
    Faculty(id: "CNTT", name_faculty: "Công nghệ thông tin"),
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
    // ListSelected = List.generate(dsKhoa.length, (_) => false,);
    for (var item in dsKhoa) {
      ListSelected[item.name_faculty] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Chọn khoa:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            //cac item
            SizedBox(height: 8),
            Expanded(
              // child: GridView.count(
              //   // physics: NeverScrollableScrollPhysics(),
              //   crossAxisCount: 1,
              //   shrinkWrap: true,
              //   crossAxisSpacing: 5,
              //   mainAxisSpacing: 5,
              //   childAspectRatio: 4,
              //   children: [...dsKhoa.map((e) => customItem(false, e.name_faculty)).toList()],
              // ),
              child: ListView.builder(
                itemCount: ListSelected.length,
                itemBuilder: (context, index) {
                  final value = ListSelected.entries.elementAt(index);
                  String key = value.key;
                  bool selected = value.value;
                  return customItem(selected, key);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Quay lại",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Xác nhận",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customItem(bool selected, String nameKhoa) {
    bool selec = ListSelected[nameKhoa]!;
    return InkWell(
      onTap: () {
        setState(() {
          ListSelected[nameKhoa] = !(ListSelected[nameKhoa])!;
          // print(selected);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: Colors.blue,
            value: selec,
            onChanged: (value) {
              setState(() {
                ListSelected[nameKhoa] = value!;
              });
            },
          ),
          SizedBox(width: 8),
          Text(nameKhoa, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
