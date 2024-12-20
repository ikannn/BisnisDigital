import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool isBookingDiTempatSelected =
      true; // Diinisialisasi ke true untuk memilih tombol "Booking di Tempat" sejak awal
  bool isBookingDiLokasiAndaSelected = false;

  void _onBookingDiTempatPressed() {
    setState(() {
      isBookingDiTempatSelected = true;
      isBookingDiLokasiAndaSelected = false;
    });
  }

  void _onBookingDiLokasiAndaPressed() {
    setState(() {
      isBookingDiTempatSelected = false;
      isBookingDiLokasiAndaSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Riwayat Pesanan'),
        backgroundColor:
            const Color(0xFF9C2A15), // Menggunakan warna yang konsisten
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0, // Anda bisa menyesuaikan ukuran font sesuai kebutuhan
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), // Menambahkan jarak di atas
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _onBookingDiTempatPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBookingDiTempatSelected
                              ? const Color(0xFF9C2A15)
                              : Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Booking di Tempat'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _onBookingDiLokasiAndaPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBookingDiLokasiAndaSelected
                              ? const Color(0xFF9C2A15)
                              : Colors.grey,
                          foregroundColor: Colors.white,
                          side: BorderSide(
                              color: isBookingDiLokasiAndaSelected
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                        child: const Text('Booking di Lokasi Anda'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300, // Menambahkan lebar untuk memperpanjang kotak
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center, // Menempatkan teks di tengah
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    child: const Text('Tidak ada Riwayat Pesanan!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const custom_menubar.MenuBar(),
    );
  }
}
