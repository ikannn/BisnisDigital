// components/menubar.dart

import 'package:flutter/material.dart';
import '../screen/home.dart'; // Untuk navigasi ke HomePage
import '../screen/profile.dart'; // Untuk navigasi ke ProfileScreen
import '../screen/notification.dart'; // Untuk navigasi ke NotificationScreen
import '../screen/transaction.dart'; // Untuk navigasi ke TransactionScreen

class MenuBar extends StatefulWidget {
  const MenuBar({super.key});

  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<MenuBar> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index; // Perbarui index terpilih
    });

    // Navigasi berdasarkan index tab
    if (index == 0) {
      // Navigasi ke halaman HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      // Navigasi ke halaman NotificationScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationScreen()),
      );
    } else if (index == 2) {
      // Navigasi ke halaman TransactionScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionScreen()),
      );
    } else if (index == 3) {
      // Navigasi ke halaman ProfileScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEF6950),
            Color(0xFF3B0900),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: _currentIndex == 0 ? 30 : 24,
              color: _currentIndex == 0
                  ? const Color.fromARGB(255, 221, 218, 217)
                  : Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: _currentIndex == 1 ? 30 : 24,
              color: _currentIndex == 1
                  ? const Color.fromARGB(255, 221, 218, 217)
                  : Colors.white,
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
              size: _currentIndex == 2 ? 30 : 24,
              color: _currentIndex == 2
                  ? const Color.fromARGB(255, 221, 218, 217)
                  : Colors.white,
            ),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: _currentIndex == 3 ? 30 : 24,
              color: _currentIndex == 3
                  ? const Color.fromARGB(255, 221, 218, 217)
                  : Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.white.withOpacity(1),
        onTap: _onTap,
      ),
    );
  }
}
