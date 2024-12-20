import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;
import 'paymentsuccess.dart'; // Impor halaman PaymentSuccess

class PaymentPage extends StatefulWidget {
  // Parameter untuk menerima data dari halaman sebelumnya
  final String barberName;
  final String customerName;
  final String selectedDate;
  final String selectedTime;
  final String selectedStylist;
  final String bill;

  // Konstruktor wajib untuk menerima data
  const PaymentPage({
    super.key,
    required this.barberName,
    required this.customerName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedStylist,
    required this.bill,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C2A15), // Warna coklat
        title: const Text(
          'Pembayaran',
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
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Detail Booking',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  buildDetailRow('Nama Barbershop', widget.barberName),
                  buildDetailRow('Nama Pelanggan', widget.customerName),
                  buildDetailRow('Tanggal', widget.selectedDate),
                  buildDetailRow('Waktu', widget.selectedTime),
                  buildDetailRow('Stylish', widget.selectedStylist),
                  buildDetailRow('Tagihan', widget.bill),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Dropdown untuk metode pembayaran dalam box
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Metode Pembayaran',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: selectedPaymentMethod,
                items: [
                  DropdownMenuItem(
                    value: 'Dana',
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet, color: Colors.green),
                        const SizedBox(width: 8),
                        Text('Dana'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Gopay',
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text('Gopay'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'OVO',
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet,
                            color: Colors.purple),
                        const SizedBox(width: 8),
                        Text('OVO'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Transfer Bank Virtual Account',
                    child: Row(
                      children: [
                        Icon(Icons.account_balance, color: Colors.brown),
                        const SizedBox(width: 8),
                        Text('Transfer Bank Virtual Account'),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            // Card untuk summary pembayaran
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  buildDetailRow('Subtotal', 'Rp. 50.000'),
                  buildDetailRow('Biaya Layanan', 'Rp. 5.000'),
                  buildDetailRow('Total', 'Rp. 55.000'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Tombol Pembayaran
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessPage(
                          barberName: widget.barberName,
                          customerName: widget.customerName,
                          selectedDate: widget.selectedDate,
                          selectedTime: widget.selectedTime,
                          selectedStylist: widget.selectedStylist,
                          totalPayment: widget.bill,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 113, // Lebih panjang
                      vertical: 15,
                    ),
                    backgroundColor: const Color(0xFFCD4C35), // Warna baru
                    foregroundColor: Colors.white, // Warna tulisan tombol
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Pembayaran'),
                ),
              ),
            ),
          ],
        ),
      ),

      // MenuBar sebagai bottom navigation
      bottomNavigationBar: custom_menubar.MenuBar(),
    );
  }

  // Widget untuk membuat baris detail
  Widget buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
