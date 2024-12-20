import 'package:cut_fix/app/booking1.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../components/menubar.dart' as custom_menubar; // Impor MenuBar

class ProfileBarber1 extends StatefulWidget {
  final Map<String, dynamic> barbershop;

  const ProfileBarber1({required this.barbershop, super.key});

  @override
  _ProfileBarberState1 createState() => _ProfileBarberState1();
}

class _ProfileBarberState1 extends State<ProfileBarber1> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/barber_video.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Barbershop', // Ganti nama menjadi "Profil Barbershop"
          style: TextStyle(
            color: Colors.white, // Mengubah warna tulisan menjadi putih
            fontWeight: FontWeight.bold, // Membuat tulisan menjadi bold
          ),
        ),
        backgroundColor: const Color(0xFF9C2A15),
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengubah warna ikon arrow back menjadi putih
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        widget.barbershop['image'],
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.barbershop['name'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.barbershop['rating']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 0.1),
                          const Text(
                            'Rp. 50.000',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Deskripsi Barbershop',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Jam Buka: 10.00 - 20.30 WITA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Model Terbaik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/hairstyle1.png',
                          width: 70, height: 70),
                      const SizedBox(height: 8),
                      const Text('Comma Hair', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/hairstyle2.png',
                          width: 70, height: 70),
                      const SizedBox(height: 8),
                      const Text('Buzz Cut', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/hairstyle3.png',
                          width: 70, height: 70),
                      const SizedBox(height: 8),
                      const Text('Two Block', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/hairstyle4.png',
                          width: 70, height: 70),
                      const SizedBox(height: 8),
                      const Text('Under Cut', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Video Model',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(
                      height: 200,
                      color: Colors.black12,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Penilaian dan Komentar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24,
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final comments = [
                            {
                              'name': 'Don013',
                              'comment':
                                  'Pemotongan bagus, rapi, dan saya rekomendasikan.',
                            },
                            {
                              'name': 'Andi76',
                              'comment':
                                  'Hasilnya memuaskan dan keren bangett, mantap.',
                            },
                            {
                              'name': 'Alam212',
                              'comment':
                                  'Pelayanan ramah dan tepat waktu sesuai jadwal booking.',
                            },
                          ];

                          return ListTile(
                            leading: const Icon(Icons.account_circle, size: 40),
                            title: Text(comments[index]['name']!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(5, (starIndex) {
                                    return Icon(
                                      Icons.star,
                                      color: starIndex < 5
                                          ? Colors.yellow
                                          : Colors.grey,
                                      size: 16,
                                    );
                                  }),
                                ),
                                const SizedBox(height: 4),
                                Text(comments[index]['comment']!),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika untuk menampilkan semua komentar
                          },
                          child: const Text('Lihat Semua Komentar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Tombol "Booking Barber" besar di bagian bawah dengan warna baru dan ukuran panjang
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Menambahkan logika untuk navigasi ke halaman booking.dart
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Booking1(), // Mengarah ke halaman Booking
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
                    child: const Text('Booking Barber'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const custom_menubar.MenuBar(), // Menambahkan MenuBar
    );
  }
}
