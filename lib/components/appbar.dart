import 'package:flutter/material.dart';
// Hapus baris berikut karena tidak digunakan
// import 'package:fireguard1_project/auth/login.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEF6950),
            Color(0xFF3B0900)
          ], // Gradient with specified colors
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.cut, // Ganti icon arrow_back dengan ikon gunting
            color: Color.fromARGB(
                255, 255, 255, 255), // Mengubah warna ikon menjadi putih
          ),
          onPressed: () {
            // Hapus atau kosongkan fungsi ini agar tidak ada aksi saat ikon ditekan
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Selamat datang di Cut & Go',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xB3FFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
