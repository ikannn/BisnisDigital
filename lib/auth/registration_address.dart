import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'login.dart'; // Import the login page
import 'registration.dart'; // Import the registration page

class RegistrationAddressPage extends StatefulWidget {
  const RegistrationAddressPage({super.key});

  @override
  State<RegistrationAddressPage> createState() =>
      _RegistrationAddressPageState();
}

class _RegistrationAddressPageState extends State<RegistrationAddressPage> {
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final Logger logger = Logger();

  void _useCurrentLocation() {
    // Add your logic to use current location here
    logger.i('Use current location');
  }

  void _continue() {
    // Add your logic to proceed to the next step here
    final province = _provinceController.text;
    final city = _cityController.text;
    final district = _districtController.text;
    final street = _streetController.text;
    final details = _detailsController.text;
    logger.i(
        'Province: $province, City: $city, District: $district, Street: $street, Details: $details');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RegistrationPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _provinceController,
              decoration: const InputDecoration(
                labelText: 'Provinsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Kota',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _districtController,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _streetController,
              decoration: const InputDecoration(
                labelText: 'Nama Jalan, Gedung, No. Rumah',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                labelText: 'Detail Lainnya (Cth: Blok /No. Patokan)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _useCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Gunakan Lokasi Saat Ini'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF6950), Color(0xFF3B0900)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: _continue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
