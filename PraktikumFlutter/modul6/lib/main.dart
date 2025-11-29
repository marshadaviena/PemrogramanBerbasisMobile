import 'package:flutter/material.dart';
import 'home_page.dart'; // Import halaman Home
import 'second_page.dart'; // Import halaman Kedua

void main() {
  runApp(const MyApp());
}

// ===========================================================
// Widget utama aplikasi
// ===========================================================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// ===========================================================
// State untuk mengatur tema (Light / Dark Mode)
// ===========================================================
class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Menyimpan status tema (gelap / terang)

  // Fungsi untuk mengganti tema
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Navigation',
      debugShowCheckedModeBanner: false,

      // Mode tema berdasarkan switch
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Tema terang
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF8F4FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEDE7F6),
          foregroundColor: Colors.deepPurple,
        ),
      ),

      // Tema gelap
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E2C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D2D44),
          foregroundColor: Colors.white,
        ),
      ),

      // Rute awal aplikasi
      initialRoute: '/',

      // Definisi semua rute
      routes: {
        '/': (context) =>
            HomePage(isDarkMode: _isDarkMode, onThemeToggle: _toggleTheme),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}