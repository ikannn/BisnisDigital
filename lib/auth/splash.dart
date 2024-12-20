import 'package:flutter/material.dart';
import 'onboarding.dart'; // Import the onboarding page

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Menunggu beberapa saat sebelum berpindah ke halaman onboarding
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Pastikan widget masih terpasang
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/cutgo.png', // Pastikan path sesuai dengan lokasi gambar
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            const Text(
              'Cut & Go',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
