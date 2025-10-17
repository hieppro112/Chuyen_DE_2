import 'package:flutter/material.dart';

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset('assets/images/logo.png', width: 200, height: 200),
                const SizedBox(height: 10),
                // tiêu đề
                const Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                // Email
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Mật khẩu
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Xử lý quên mật khẩu
                    },
                    child: const Text(
                      "Quên mật khẩu?",
                      style: TextStyle(color: Color.fromARGB(255, 243, 33, 33)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Xử lý
                    },
                    child: const Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Liên kết đến trang đăng nhập
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Bạn chưa có tài khoản ? "),
                    GestureDetector(
                      onTap: () {
                        // chuyển sang đăng nhập
                      },
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
