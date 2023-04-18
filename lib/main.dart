import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'count_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountUp(title: 'Flutter Counter App'),
    );
  }
}
