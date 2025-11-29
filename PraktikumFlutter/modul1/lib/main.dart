import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SetState Example',
      home: CounterPage(), // Halaman utama adalah CounterPage
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

// StatefulWidget untuk halaman counter
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      debugPrint('Counter incremented to: $_counter');
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
      debugPrint('Counter decremented to: $_counter');
    });
  }

  // 4. Bangun UI yang menggunakan state
  @override
  Widget build(BuildContext context) {
    debugPrint('Building CounterPageState...');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$_counter', // Menampilkan nilai state _counter
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold, // Membuat angka lebih tebal
              ),
            ),
            const SizedBox(height: 50),
            // KREDIT
            Text(
              'Created by Marsha Daviena Zalyadieza A',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Tombol Kurang (FITUR BARU)
            FloatingActionButton(
              heroTag: "decrementButton",
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            // Tombol Tambah
            FloatingActionButton(
              heroTag: "incrementButton",
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
