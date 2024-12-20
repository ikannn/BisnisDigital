import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar; // Impor dengan alias
import 'payment.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  String? selectedStylist;

  // List waktu yang tersedia
  List<String> generateTimeSlots() {
    List<String> timeSlots = [];
    for (int hour = 10; hour < 21; hour++) {
      timeSlots.add('$hour:00');
      if (hour < 20.30) {
        timeSlots.add('$hour:30');
      }
    }
    return timeSlots;
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = generateTimeSlots();
    final stylists = [
      'Galih Ahmad Guntur',
      'Priyo Cahya Matahari',
      'Prasetyo Satria Mahatir'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C2A15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Text(
          'Booking Barber',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSectionTitle('Pilih Tanggal'),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              buildSectionTitle('Pilih Waktu'),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: timeSlots.map((time) {
                    final isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Card(
                        color:
                            isSelected ? const Color(0xFFCD4C35) : Colors.white,
                        child: Center(
                          child: Text(
                            time,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              buildSectionTitle('Pilih Stylish'),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: stylists.map((stylist) {
                    final isSelected = selectedStylist == stylist;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedStylist = stylist;
                        });
                      },
                      child: Card(
                        color:
                            isSelected ? const Color(0xFFCD4C35) : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              stylist,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Validasi jika semua data sudah dipilih
                  if (selectedTime != null && selectedStylist != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          barberName: 'Keluncum Barbershop Siaga',
                          customerName: 'User',
                          selectedDate:
                              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          selectedTime: selectedTime!,
                          selectedStylist: selectedStylist!,
                          bill: 'Rp. 50.000',
                        ),
                      ),
                    );
                  } else {
                    // Jika ada yang belum dipilih, tampilkan snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Harap pilih waktu dan stylish terlebih dahulu.',
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 135,
                    vertical: 15,
                  ),
                  backgroundColor: const Color(0xFFCD4C35),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Booking'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: custom_menubar.MenuBar(),
    );
  }

  // Fungsi untuk membuat judul setiap bagian
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
