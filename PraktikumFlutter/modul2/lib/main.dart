import 'package:flutter/material.dart';

// Variabel Global untuk Mengelola Tema
final currentTheme = ValueNotifier(ThemeMode.light);

void main() => runApp(const MyApp());

// MyApp sekarang menggunakan ValueListenableBuilder untuk mengontrol tema
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
      valueListenable: currentTheme,
      builder: (_, themeMode, __) => MaterialApp(
        title: 'User Input Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: themeMode,
        home: const UserInputPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
}

// Halaman harus StatefulWidget untuk menyimpan input text
class UserInputPage extends StatefulWidget {
  const UserInputPage({super.key});

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  // State untuk menyimpan teks input & Controller
  String _inputText = "";
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Helper untuk membersihkan input
  void _clearText() {
    _controller.clear();
    setState(() => _inputText = ""); // Menggunakan arrow function
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input Example'),
        actions: [
          // Tombol Toggle Dark Mode
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => currentTheme.value = isDarkMode ? ThemeMode.light : ThemeMode.dark, // Arrow function
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField untuk input
            TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _inputText = value), // Arrow function
              decoration: const InputDecoration(
                labelText: 'Enter some text',
                hintText: 'Type here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Tampilkan state yang sudah diupdate
            Text(
              'You entered: $_inputText',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Tombol untuk clear text
            ElevatedButton(
              onPressed: _clearText,
              child: const Text('Clear Text'),
            ),
            const SizedBox(height: 50),

            Text(
              'Created by Marsha Daviena Zalyadieza A',
              style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodySmall?.color),
            ),
          ],
        ),
      ),
    );
  }
}