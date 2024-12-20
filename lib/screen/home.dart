import 'package:cut_fix/app/bookingkerumah.dart';
import 'package:flutter/material.dart';
import '../components/appbar.dart'; // Mengimpor CustomAppBar
import '../components/menubar.dart' as custom; // Mengimpor MenuBar widget
import '../app/bookingbarber.dart'; // Mengimpor halaman BookingBarber

const List<Map<String, dynamic>> barbershops = [
  {
    'name': 'Keluncum Barbershop',
    'rating': 4.6,
    'image': 'assets/images/barber1.png',
  },
  {
    'name': 'Lucky Barbershop',
    'rating': 4.5,
    'image': 'assets/images/barber2.png',
  },
  {
    'name': 'Cut & Ro Barbershop',
    'rating': 4.8,
    'image': 'assets/images/barber3.png',
  },
  {
    'name': 'Gentlefox Barbershop',
    'rating': 4.2,
    'image': 'assets/images/barber4.png',
  },
  {
    'name': 'Barbershop Start 1',
    'rating': 4.6,
    'image': 'assets/images/barber5.png',
  },
  {
    'name': 'DJR Barbershop',
    'rating': 4.5,
    'image': 'assets/images/barber6.png',
  },
  {
    'name': 'Paddys Barbershop',
    'rating': 4.6,
    'image': 'assets/images/barber7.png',
  },
  {
    'name': 'Bejo Barbershop',
    'rating': 4.5,
    'image': 'assets/images/barber8.png',
  },
  {
    'name': 'Barbershop CahKing',
    'rating': 4.6,
    'image': 'assets/images/barber9.png',
  },
  {
    'name': 'Coolio Barbershop',
    'rating': 4.1,
    'image': 'assets/images/barber10.png',
  },
  {
    'name': 'Coolman Barbershop',
    'rating': 4.5,
    'image': 'assets/images/barber11.png',
  },
  {
    'name': 'Senor Barbershop',
    'rating': 4.7,
    'image': 'assets/images/barber12.png',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Berita & Promo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B0900), // Menggunakan warna 3B0900 untuk teks
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildNewsItem(
                      'assets/images/berita1.png', 'Promo Pengguna Baru'),
                  _buildNewsItem(
                      'assets/images/berita2.png', 'Diskon Akhir Tahun'),
                  _buildNewsItem(
                      'assets/images/berita3.png', 'Penawaran Spesial'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Layanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B0900), // Menggunakan warna 3B0900 untuk teks
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildServiceItem(
                    context, Icons.location_on, 'Booking ke Barbershop'),
                _buildServiceItem1(
                    context, Icons.home, 'Booking ke Lokasi Anda'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Rekomendasi Barbershop',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B0900),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: barbershops.map((barbershop) {
                return _buildBarbershopItem(
                  barbershop['image'],
                  barbershop['name'],
                  barbershop['rating'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const custom.MenuBar(),
    );
  }

  Widget _buildNewsItem(String imagePath, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 300, // Sesuaikan lebar jika perlu
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEF6950),
            Color(0xFF3B0900),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 180, // Sesuaikan tinggi jika perlu
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, IconData icon, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEF6950), Color(0xFF3B0900)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman BookingBarber
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingBarber()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40, // Sesuaikan ukuran ikon jika perlu
                color: Colors.white, // Mengatur warna ikon menjadi putih
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14, // Sesuaikan ukuran font jika perlu
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengatur warna teks menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem1(BuildContext context, IconData icon, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEF6950), Color(0xFF3B0900)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman BookingBarber
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingBarber1()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40, // Sesuaikan ukuran ikon jika perlu
                color: Colors.white, // Mengatur warna ikon menjadi putih
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14, // Sesuaikan ukuran font jika perlu
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengatur warna teks menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarbershopItem(String imagePath, String name, double rating) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating.floor() ? Icons.star : Icons.star_border,
              size: 16,
              color: Colors.yellow[700],
            );
          }),
        ),
      ),
    );
  }
}
