import 'package:cloud_firestore/cloud_firestore.dart';
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
  // bool isload =false;

  List<Faculty> dsKhoa = [
    // Faculty(id: "CNTT", name_faculty: "Công nghệ thông tin"),
    // Faculty(id: "KT", name_faculty: "Kế toán"),
    // Faculty(id: "DT", name_faculty: "Điện"),
    // Faculty(id: "OT", name_faculty: "Ô tô"),
    // Faculty(id: "CK", name_faculty: "Cơ Khí"),
    // Faculty(id: "DL", name_faculty: "Du lich"),
    // Faculty(id: "DP", name_faculty: "Đông phương học"),
    // Faculty(id: "PC", name_faculty: "Bartender"),
    // Faculty(id: "TD", name_faculty: "Tự động hóa"),
    // Faculty(id: "KS", name_faculty: "khách sạn"),
    // Faculty(id: "NA", name_faculty: "Nấu ăn"),
    // Faculty(id: "QT", name_faculty: "Quản trị kinh doanh"),
    // Faculty(id: "QT", name_faculty: "Quản trị kinh kk"),
    
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    // ListSelected = List.generate(dsKhoa.length, (_) => false,);
    for (var item in dsKhoa) {
      ListSelected[item.name_faculty] = false;
    }

    //firebase vao ds khoa 
    fetchFaculty();
  }

  @override
  Widget build(BuildContext context){
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
              
              child:
              //  (isload)? Center(child: CircularProgressIndicator(),)
              // :
              ListView.builder(
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
  //dua du lieu firebase vao list khoa 
   //lay cac khoa tu fibase ve
  Future<void> fetchFaculty() async {
  try {
    print("=== Bắt đầu load Faculty ===");
    final snap = await FirebaseFirestore.instance.collection('Faculty').get();
    print("Số lượng document: ${snap.docs.length}");

    for (var doc in snap.docs) {
      print("${doc.id} => ${doc.data()}");
    }

    final data = snap.docs.map((e) {
      final map = e.data();
      return Faculty(id: e.id, name_faculty: map['name'] ?? '');
    }).toList();

    setState(() {
      dsKhoa = data;
      ListSelected = {for (var item in dsKhoa) item.name_faculty: false};
    });

    print("✅ Load xong ${dsKhoa.length} khoa");
  } catch (e) {
    print("🔥 Lỗi khi load Faculty: $e");
  }
}

}
