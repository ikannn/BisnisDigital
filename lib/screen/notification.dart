import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.white, // Change font color to white
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
        backgroundColor: const Color(0xFF9C2A15),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change back arrow icon color to white
        ),
      ),
      body: const NotificationContent(),
      bottomNavigationBar: const custom_menubar.MenuBar(),
    );
  }
}

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: NotificationCard(),
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.notifications, color: Color(0xFF9C2A15)),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Ada promo baru, untuk anda sebagai pengguna baru lho !!!',
          ),
        ),
      ),
    );
  }
}
