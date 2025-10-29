import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/widget/customSearch.dart';
import 'chi_tiet_tai_khoan.dart'; // 👈 import màn chi tiết

class TruyXuatTaiKhoan extends StatefulWidget {
  const TruyXuatTaiKhoan({super.key});

  @override
  State<TruyXuatTaiKhoan> createState() => _TruyXuatTaiKhoan();
}

class _TruyXuatTaiKhoan extends State<TruyXuatTaiKhoan> {
  String selectedKhoa = "Khoa Công Nghệ Thông Tin";

  final List<String> khoaList = [
    "Khoa Công Nghệ Thông Tin",
    "Khoa Kinh tế",
    "Khoa Cơ khí",
    "Khoa Điện - Điện tử",
    "Khoa Đông Phương",
    "Khoa Động Lực",
    "Khoa Quản trị kinh doanh",
    "Khoa Du lịch",
  ];

  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _accountData = [
    {
      "username": "Lê Đình Thuận",
      "id": "23211TT1371",
      "khoa": "Khoa Công Nghệ Thông Tin",
      "email": "23211TT1371@mail.tdc.edu.vn",
    },
    {
      "username": "Lê Đại Hiệp",
      "id": "23211TT1324",
      "khoa": "Khoa Công Nghệ Thông Tin",
      "email": "23211TT1324@mail.tdc.edu.vn",
    },
    {
      "username": "Cao Quang Khánh",
      "id": "23211TT4567",
      "khoa": "Khoa Công Nghệ Thông Tin",
      "email": "23211TT4567@mail.tdc.edu.vn",
    },
    {
      "username": "Phạm Thắng",
      "id": "23211TT7890",
      "khoa": "Khoa Công Nghệ Thông Tin",
      "email": "23211TT7890@mail.tdc.edu.vn",
    },
    {
      "username": "Lê Văn Tèo",
      "id": "23211TT2345",
      "khoa": "Khoa Công Nghệ Thông Tin",
      "email": "23211TT2345@mail.tdc.edu.vn",
    },
  ];

  List<Map<String, String>> _filteredAccounts = [];

  @override
  void initState() {
    super.initState();
    _filteredAccounts = _accountData;
  }

  void _filterAccounts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredAccounts = _accountData;
      } else {
        _filteredAccounts = _accountData.where((account) {
          final name = account["username"]!.toLowerCase();
          final id = account["id"]!.toLowerCase();
          final search = query.toLowerCase();
          return name.contains(search) || id.contains(search);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Truy Xuất Tài Khoản'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("assets/icons/ic_back.png", width: 32, height: 32),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [SizedBox(width: 48)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customsearch(onTap: (value) => _filterAccounts(value)),
            const SizedBox(height: 20),

            // Dropdown chọn khoa
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(66, 0, 0, 0)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedKhoa,
                  items: khoaList.map((khoa) {
                    return DropdownMenuItem<String>(
                      value: khoa,
                      child: Text(khoa),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => selectedKhoa = newValue!);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Danh sách tài khoản",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Kết quả: ${_filteredAccounts.length}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _filteredAccounts.length,
                itemBuilder: (context, index) {
                  final user = _filteredAccounts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChiTietTaiKhoan(
                            ten: user["username"]!,
                            mssv: user["id"]!,
                            khoa: user["khoa"]!,
                            email: user["email"]!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 1),
                        borderRadius: BorderRadius.circular(18),
                        color: const Color.fromARGB(255, 255, 250, 250),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/user.png",
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user["username"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                user["id"]!,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
