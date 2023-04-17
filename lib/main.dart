import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CountUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountUpPage(title: 'Flutter Counter App'),
    );
  }
}
