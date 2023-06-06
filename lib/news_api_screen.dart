import 'package:flutter/material.dart';

import 'database_helper.dart';


class NewsApiscreen extends StatefulWidget {
  const NewsApiscreen({super.key});

  @override
  State<NewsApiscreen> createState() => NewsApiState();
}

class NewsApiState extends State<NewsApiscreen> {

  // 取得したデータをデータベースに保存する
  DatabaseHelper helper = DatabaseHelper();
  for (var pullRequest in _pullResult) {
  await helper.insert({
  'type': 'pull_request',
  'title': pullRequest.title,
  });
  }

  for (var issue in _issueResult) {
  await helper.insert({
  'type': 'issue',
  'title': issue.title,
  });
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