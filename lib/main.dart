import 'package:flutter/material.dart';
import 'barcodescan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BarcodeScanScreen(),
    );
  }
}
