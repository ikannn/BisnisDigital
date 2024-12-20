import 'package:flutter/material.dart';
import '../components/menubar.dart'
    as custom_menubar; // Impor MenuBar dengan alias
import 'detailbooking.dart'; // Impor halaman DetailBooking
import '../screen/home.dart'; // Impor halaman Home

class PaymentSuccessPage extends StatelessWidget {
  final String barberName;
  final String customerName;
  final String selectedDate;
  final String selectedTime;
  final String selectedStylist;
  final String totalPayment;

  const PaymentSuccessPage({
    super.key,
    required this.barberName,
    required this.customerName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedStylist,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C2A15), // Warna coklat
        title: const Text(
          'Pembayaran Berhasil',
          style: TextStyle(
            color: Colors.white, // Teks putih
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Ikon kembali warna putih
          ),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
      ),

      // Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Pembayaran Anda Berhasil!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Terima kasih telah menggunakan layanan kami.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman DetailBooking dengan parameter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBookingPage(
                      barberName: barberName,
                      customerName: customerName,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                      selectedStylist: selectedStylist,
                      totalPayment: totalPayment,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCD4C35), // Warna tombol
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                foregroundColor: Colors.white, // Warna font putih
              ),
              child: const Text('Detail Booking'),
            ),
            const SizedBox(height: 20.0), // Spacer
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman utama (Home)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCD4C35), // Warna tombol
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                foregroundColor: Colors.white, // Warna font putih
              ),
              child: const Text('Kembali ke Halaman Utama'),
            ),
          ],
        ),
      ),

      // MenuBar sebagai bottom navigation
      bottomNavigationBar: custom_menubar.MenuBar(),
    );
  }
}
