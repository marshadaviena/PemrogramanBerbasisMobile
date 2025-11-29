import 'package:flutter/material.dart';

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
// State untuk mengatur tema (light/dark mode)
// ===========================================================
class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Menyimpan status dark mode

  // Fungsi untuk mengubah tema (dari light ke dark, atau sebaliknya)
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callback Example',
      debugShowCheckedModeBanner: false,

      // Mode tema berdasarkan nilai _isDarkMode
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Tema mode terang
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF9F6FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEDE7F6),
          foregroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),

      // Tema mode gelap
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF1E1E2C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D2D44),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      // Halaman utama
      home: CallbackExample(
        isDarkMode: _isDarkMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

// ===========================================================
// Halaman utama CallbackExample
// ===========================================================
class CallbackExample extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const CallbackExample({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<CallbackExample> createState() => _CallbackExampleState();
}

class _CallbackExampleState extends State<CallbackExample>
    with SingleTickerProviderStateMixin {
  int _counter = 0; // Menyimpan nilai counter
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  // Menampilkan SnackBar
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Action: $message'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Fungsi menambah counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _controller.forward(from: 0);
    _showMessage(context, 'Counter bertambah menjadi $_counter');
  }

  // 🔹 Tambahan reset counter
  // Fungsi untuk menghapus / reset counter ke 0
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _showMessage(context, 'Counter di-reset ke 0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Callback Example'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(
                widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Colors.deepPurpleAccent,
              ),
              Switch(
                value: widget.isDarkMode,
                activeColor: Colors.deepPurple,
                onChanged: widget.onThemeToggle,
              ),
            ],
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                onPressed: () {
                  _showMessage(context, 'ElevatedButton Pressed!');
                },
                child: const Text(
                  'Press Me (ElevatedButton)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 25),

              InkWell(
                onTap: () {
                  _showMessage(context, 'InkWell Tapped!');
                },
                onLongPress: () {
                  _showMessage(context, 'InkWell Long Pressed!');
                },
                splashColor: Colors.deepPurple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Tap or Long Press Me (InkWell)',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // =======================================================
              // 🔹 Fitur Counter dengan animasi
              // =======================================================
              ScaleTransition(
                scale: _animation,
                child: Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade400,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Tombol tambah counter
              ElevatedButton.icon(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Tambah Counter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Tombol baru: reset counter
              OutlinedButton.icon(
                onPressed: _resetCounter,
                icon: const Icon(Icons.refresh, color: Colors.deepPurple),
                label: const Text(
                  'Reset Counter',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurpleAccent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 40),

            
              Text(
                "by Marsha Daviena Zalyadieza A",
                style: TextStyle(
                  color: Colors.deepPurple.shade300,
                  fontSize: 13,
              
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMessage(context, 'Floating Action Button Clicked!');
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.menu),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}