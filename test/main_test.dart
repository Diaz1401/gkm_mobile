import 'package:flutter/material.dart';
import 'widget_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestApiPage(), // Menggunakan TestApiPage sebagai halaman utama
    );
  }
}
