import 'package:flutter/material.dart';
import 'package:countup/stopwatch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StopWatchScreen(),
    );
  }
}