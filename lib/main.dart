import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'count_up_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}):super();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountUpPage(title: 'Flutter Counter App'),
    );
  }
}
