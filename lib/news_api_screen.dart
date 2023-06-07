import 'package:flutter/material.dart';
import 'database_helper.dart';


class NewsApiScreen extends StatefulWidget {
  const NewsApiScreen({super.key});

  @override
  State<NewsApiScreen> createState() => NewsApiState();
}

class NewsApiState extends State<NewsApiScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _insertData() async {
    final row = <String, dynamic>{
      DatabaseHelper.columnName : _nameController.text,
      DatabaseHelper.columnAge  : int.tryParse(_ageController.text) ?? 0
    };

    final id = await DatabaseHelper.instance.insert(row);
    print('inserted row id: $id');
  }

  void _showAllData() async {
    final allRows = await DatabaseHelper.instance.queryAllRows();
    print('All rows:');
    allRows.forEach((row) => print(row));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('newsAPI取得'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _insertData,
              child: const Text('Save Data'),
            ),
            ElevatedButton(
              onPressed: _showAllData,
              child: const Text('テーブルデータ取得'),
            ),
          ],
        ),
      ),
    );
  }
}
