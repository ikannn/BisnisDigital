import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login.dart'; // Pastikan LoginPage diimpor dengan benar
import '../components/menubar.dart' as custom; // Alias untuk 'MenuBar'

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil pengguna yang sedang login
    final User? user = FirebaseAuth.instance.currentUser;

    // Jika pengguna tidak ditemukan, tampilkan placeholder
    final String displayName = user?.displayName ?? 'Pengguna';
    final String email = user?.email ?? 'user@example.com';
    final String phoneNumber = user?.phoneNumber ?? '+62 812 3456 7890';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, // Mengatur warna teks menjadi putih
            fontWeight: FontWeight.bold, // Membuat teks menjadi bold
          ),
        ),
        backgroundColor: const Color(0xFF9C2A15),
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur ikon menjadi putih
        ),
        leading: null, // Menghilangkan ikon kembali
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      displayName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email: $email',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nomor Telepon: $phoneNumber',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the logic to change password
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCD4C35),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Ganti Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman bantuan dan dukungan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCD4C35),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Bantuan dan Dukungan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  onPressed: () async {
                    // Logout pengguna
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 102, 102),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const custom.MenuBar(),
    );
  }
}
