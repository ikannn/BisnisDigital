import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(), // Push content to the bottom
            Image.asset(
              'assets/images/cutgo.png', // Make sure the path is correct
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            const Text(
              'Cut & Go',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cut & Go adalah aplikasi inovatif yang memudahkan pelanggan menemukan dan memesan layanan barber berkualitas tanpa harus mengantri.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Spacer(), // Add space to push content down
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovering = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovering = false;
                });
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _isHovering
                        ? const [
                            Color(0xFF3B0900),
                            Color(0xFFEF6950)
                          ] // Hover colors
                        : const [
                            Color(0xFFEF6950),
                            Color(0xFF3B0900)
                          ], // Normal colors
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Lanjut',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space below the button
          ],
        ),
      ),
    );
  }
}
