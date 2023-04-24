import 'package:flutter/material.dart';
import 'todolist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodolistScreen(),
    );
  }
}