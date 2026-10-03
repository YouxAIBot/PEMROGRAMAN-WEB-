import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kartu Perkenalan'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.account_circle, size: 80, color: Colors.blue),
              SizedBox(height: 16),
              Text('Nama: Firaas Ferdinal', style: TextStyle(color: Colors.blue)
              ),
              Text('NIM: [20240801011]'),
              Text('Jurusan: Informatika'),
              Text('Hobi: Game'),
            ],
          ),
        ),
      ),
    );
  }
}