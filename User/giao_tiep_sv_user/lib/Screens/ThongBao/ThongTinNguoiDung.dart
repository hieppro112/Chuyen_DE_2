import 'package:flutter/material.dart';

class ThongTinNguoiDung extends StatelessWidget {
  const ThongTinNguoiDung({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
         backgroundImage: AssetImage('assets/images/user.png'),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lê Đại Hiệp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "23211TT3598",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white, size: 18),
            onPressed: () {
              // Xử lý khi nhấn mũi tên
            },
          ),
        )
      ],
    );
  }
}
