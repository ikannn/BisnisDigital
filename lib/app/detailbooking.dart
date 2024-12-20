import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;
import 'detailbooking1.dart'; // Import halaman DetailBooking1Page

class DetailBookingPage extends StatelessWidget {
  // Parameter untuk menerima data dari halaman sebelumnya
  final String barberName;
  final String customerName;
  final String selectedDate;
  final String selectedTime;
  final String selectedStylist;
  final String totalPayment;

  // Konstruktor
  const DetailBookingPage({
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C2A15),
        title: const Text(
          'Detail Booking',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBoxedDetail(),
            const SizedBox(height: 20),
            buildProgressBarsRow(),
            const SizedBox(height: 20),
            buildBookingIDBox(),
            const SizedBox(height: 20),
            buildReminderBox(),
            const SizedBox(height: 20),
            buildConfirmationButton(context), // Tombol Konfirmasi Booking
          ],
        ),
      ),
      bottomNavigationBar: custom_menubar.MenuBar(),
    );
  }

  Widget buildBoxedDetail() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow('Nama Barbershop', barberName),
          buildDetailRow('Nama Pelanggan', customerName),
          buildDetailRow('Tanggal', selectedDate),
          buildDetailRow('Waktu', selectedTime),
          buildDetailRow('Stylish', selectedStylist),
          buildDetailRow('Tagihan', totalPayment),
          const SizedBox(height: 20),
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
    );
  }

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

  Widget buildProgressBarsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: buildProgressBar(Colors.brown, 1),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: buildProgressBar(Colors.brown, 0),
        ),
      ],
    );
  }

  Widget buildProgressBar(Color color, double progress) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FractionallySizedBox(
        widthFactor: progress,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget buildBookingIDBox() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'ID Booking',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'BT00345',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.description,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildReminderBox() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Silahkan datang pada pukul 18.30',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Jangan telat datang, dan diusahakan datang 15 menit lebih awal ya kak 😊',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConfirmationButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailBooking1Page(
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
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          minimumSize: const Size(350, 50),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: const Color(0xFFCD4C35),
        ),
        child: const Text(
          'Konfirmasi Booking',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
