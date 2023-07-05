import 'package:flutter/material.dart';
import 'news_api_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ニュースAPI表示',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const NewsApiScreen(),
    );
  }
}
