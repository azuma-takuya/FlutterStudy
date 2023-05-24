import 'package:barcode_scan2/barcode_scan2.dart' as scanner;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'jan_to_isbn_string_extension.dart';

class GithubApiScreen extends StatefulWidget {
  const GithubApiScreen({super.key});

  @override
  GithubApiState createState() => GithubApiState();
}

class GithubApiState extends State<GithubApiScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GItリポジトリ情報取得'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: controller1,
            decoration: const InputDecoration(
              hintText: 'ユーザー名入力',
            ),
          ),
          TextField(
            controller: controller2,
            decoration: const InputDecoration(
              hintText: 'プロジェクト名入力',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 検索ボタンが押されたときの処理
            },
            child: const Text('検索'),
          ),
        ],
      ),
    );
  }
}

