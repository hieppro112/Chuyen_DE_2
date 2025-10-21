import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/Widget/headerWidget.dart';
import 'TieuDe.dart';
import 'OThongBao.dart';

class ManHinhThongBao extends StatelessWidget {
  ManHinhThongBao({super.key});
  // dữ liệu giả
  final List<Map<String, String>> danhSachThongBao = [
    {"nguoiGui": "Admin", "noiDung": "Cảnh báo về hành vi ..."},
    {"nguoiGui": "Admin", "noiDung": "Cảnh báo về hành vi ..."},
    {"nguoiGui": "Admin", "noiDung": "Cảnh báo về hành vi ..."},
  ];

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Headerwidget(
                url_avt: "assets/images/avatar.png",
                fullname: "Lê Đình Thuận",
                email: "23211TT1371@gmail.com",
                width: widthScreen,
                chucnang: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icons/ic_back.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const TieuDeThongBao(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: danhSachThongBao.length,
                  itemBuilder: (context, index) {
                    final thongBao = danhSachThongBao[index];
                    return OThongBao(
                      tenNguoiGui: thongBao["nguoiGui"]!,
                      noiDung: thongBao["noiDung"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
