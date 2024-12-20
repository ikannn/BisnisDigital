import 'package:cut_fix/app/profilebarber1.dart';
import 'package:flutter/material.dart';
import '../components/menubar.dart' as custom_menubar;

class BookingBarber1 extends StatelessWidget {
  const BookingBarber1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking ke Kerumah',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF9C2A15),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: barbershops.length,
        itemBuilder: (context, index) {
          return BarbershopTile(
            name: barbershops[index]['name'] as String,
            rating: barbershops[index]['rating'] as double,
            image: barbershops[index]['image'] as String,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileBarber1(
                    barbershop: barbershops[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const custom_menubar.MenuBar(),
    );
  }
}

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

class BarbershopTile extends StatelessWidget {
  final String name;
  final double rating;
  final String image;
  final VoidCallback onTap;

  const BarbershopTile({
    required this.name,
    required this.rating,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  Text('$rating'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
