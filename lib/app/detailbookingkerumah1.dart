import 'package:cut_fix/app/review1.dart';
import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;


class DetailBooking2Page extends StatelessWidget {
  // Parameters to receive data from the previous page
  final String barberName;
  final String customerName;
  final String selectedDate;
  final String selectedTime;
  final String selectedStylist;
  final String destinationAddress;
  final String totalPayment;

  // Constructor
  const DetailBooking2Page({
    super.key,
    required this.barberName,
    required this.customerName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedStylist,
    required this.destinationAddress,
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
            buildConfirmationBox(context),
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
          buildDetailRow('Alamat', destinationAddress),
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
          child: buildProgressBar(Colors.brown, 1),
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
          Icon(
            Icons.description,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildReminderBox() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stylish Kami Akan Tiba Pada 18.30',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Harap Bersabar Menunggu ya Kak 😊',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking anda telah Selesai',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Jangan lupa konfirmasi booking selesai, dan memberikan reviewnya ya kak 😊',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildConfirmationBox(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewPage1(
                barberName: barberName,
                customerName: customerName,
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                selectedStylist: selectedStylist,
                destinationAddress: destinationAddress,
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
