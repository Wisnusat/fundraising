import 'package:flutter/material.dart';

void main() {
  runApp(const BantuInApp());
}

class BantuInApp extends StatelessWidget {
  const BantuInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bantu.In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Poppins'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Jika ingin navigasi ke halaman berikutnya setelah beberapa detik
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const HomeScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40BFB4), // Warna teal custom
      body: Stack(
        children: [
          // App name di tengah
          Center(
            child: Text(
              'Bantu.In',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          // Progress indicator di bawah
          Positioned(
            bottom: 40,
            left: 60,
            right: 60,
            child: SizedBox(
              height: 2,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
