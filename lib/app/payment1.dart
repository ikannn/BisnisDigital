import 'package:cut_fix/app/paymentsuccess1.dart';
import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;

class PaymentPage1 extends StatefulWidget {
  // Parameter untuk menerima data dari halaman sebelumnya
  final String barberName;
  final String customerName;
  final String selectedDate;
  final String selectedTime;
  final String selectedStylist;
  final String bill;
  final String destinationAddress; // Tambahkan parameter alamat

  const PaymentPage1({
    super.key,
    required this.barberName,
    required this.customerName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedStylist,
    required this.bill,
    required this.destinationAddress, // Tambahkan parameter alamat
  });

  @override
  _PaymentPageState1 createState() => _PaymentPageState1();
}

class _PaymentPageState1 extends State<PaymentPage1> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C2A15), // Warna coklat
        title: const Text(
          'Pembayaran Booking Kerumah',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card untuk detail pembayaran
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow('Nama Barber', widget.barberName),
                  buildDetailRow('Nama Pemesan', widget.customerName),
                  buildDetailRow('Tanggal', widget.selectedDate),
                  buildDetailRow('Waktu', widget.selectedTime),
                  buildDetailRow('Stylish', widget.selectedStylist),
                  buildDetailRow('Alamat Tujuan', widget.destinationAddress), // Menampilkan alamat
                  buildDetailRow('Total Biaya', widget.bill),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Pilihan metode pembayaran
            buildSectionTitle('Pilih Metode Pembayaran'),
            Column(
              children: ['Cash', 'Bank Transfer', 'E-wallet']
                  .map((method) => RadioListTile<String>(
                        title: Text(method),
                        value: method,
                        groupValue: selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentMethod = value;
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20.0),

            // Tombol Konfirmasi
            ElevatedButton(
              onPressed: selectedPaymentMethod != null
                  ? () {
                      // Navigasi ke halaman sukses jika pembayaran dipilih
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessPage1(
                          barberName: widget.barberName,
                          customerName: widget.customerName,
                          selectedDate: widget.selectedDate,
                          selectedTime: widget.selectedTime,
                          selectedStylist: widget.selectedStylist,
                          totalPayment: widget.bill, 
                          destinationAddress: widget.destinationAddress,
                        ),
                      ),
                    );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                backgroundColor: const Color(0xFFCD4C35),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Konfirmasi Pembayaran'),
            ),
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: custom_menubar.MenuBar(),
    );
  }

  // Widget untuk detail booking
  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  // Widget untuk judul setiap bagian
  Widget buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
