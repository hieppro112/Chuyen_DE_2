import 'package:flutter/material.dart';
import 'ThongTinNguoiDung.dart';
import 'TieuDe.dart';
import 'OThongBao.dart';

class ManHinhThongBao extends StatelessWidget {
  const ManHinhThongBao({super.key});



  @override
  Widget build(BuildContext context) {
    // dữ liệu giả
    final List<Map<String, String>> danhSachThongBao = [
      {"nguoiGui": "Admin", "noiDung": "Cảnh báo Hiệp về hành vi ..."},
      {"nguoiGui": "Admin", "noiDung": "Cảnh báo Hiệp về hành vi ..."},
      {"nguoiGui": "Admin", "noiDung": "Cảnh báo Hiệp về hành vi ..."},
      
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              const ThongTinNguoiDung(),
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
