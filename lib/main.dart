import 'package:countup/github_api_screen.dart';
import 'package:countup/news_api_screen.dart';
import 'package:flutter/material.dart';

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
      home: const NewsApiScreen(),
    );
  }
}
