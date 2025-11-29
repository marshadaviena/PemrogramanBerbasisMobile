import 'package:flutter/material.dart';
import 'produk_form.dart'; // Import halaman form produk

void main() {
  runApp(const MyApp());
}

// ===========================================================
// Widget utama aplikasi (root widget)
// ===========================================================
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Passing Demo',
      home: const ProdukForm(), // Halaman awal aplikasi
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}