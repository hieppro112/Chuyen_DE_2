import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Data/faculty.dart';

class CustomAllKhoa extends StatefulWidget {
  final ValueChanged<bool>? selected;
  const CustomAllKhoa({super.key, this.selected});

  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const CustomAllKhoa(),
    );
  }

  @override
  State<CustomAllKhoa> createState() => CustomAllKhoaState();
}

class CustomAllKhoaState extends State<CustomAllKhoa> {
  Map<String, bool> listSelected = {};
  List<Faculty> dsKhoa = [];
  bool isLoading = true; // ✅ Biến trạng thái loading

  @override
  void initState() {
    super.initState();
    fetchFaculty(); // Gọi hàm load dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chọn khoa:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // ✅ Hiển thị vòng load hoặc danh sách
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : listSelected.isEmpty
                      ? const Center(
                          child: Text(
                            "Không có dữ liệu khoa.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: listSelected.length,
                          itemBuilder: (context, index) {
                            final entry = listSelected.entries.elementAt(index);
                            final nameKhoa = entry.key;
                            final selected = entry.value;
                            return customItem(selected, nameKhoa);
                          },
                        ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Quay lại",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
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
    return InkWell(
      onTap: () {
        setState(() {
          listSelected[nameKhoa] = !selected;
        });
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.blue,
            value: selected,
            onChanged: (value) {
              setState(() {
                listSelected[nameKhoa] = value ?? false;
              });
            },
          ),
          const SizedBox(width: 8),
          Text(
            nameKhoa,
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
  }

  // lấy dl từ fireabase khoa
  Future<void> fetchFaculty() async {
    try {
      setState(() => isLoading = true);

      final snap = await FirebaseFirestore.instance.collection('Faculty').get();

      final data = snap.docs.map((e) {
        final map = e.data();
        return Faculty(id: e.id, name_faculty: map['name'] ?? '');
      }).toList();

      if (!mounted) return;
      setState(() {
        dsKhoa = data;
        listSelected = {
          for (var item in dsKhoa) item.name_faculty: false,
        };
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      debugPrint("🔥 Lỗi khi load Faculty: $e");
    }
  }
}
