import 'package:flutter/material.dart';

import 'database_helper.dart';


class NewsApiscreen extends StatefulWidget {
  const NewsApiscreen({super.key});

  @override
  State<NewsApiscreen> createState() => NewsApiState();
}

class NewsApiState extends State<NewsApiscreen> {

  void _insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'Alice',
      DatabaseHelper.columnAge  : 20
    };

    final id = await DatabaseHelper.instance.insert(row);
    print('inserted row id: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('newsAPI取得'),
    ),
    body: Column();
  }
}