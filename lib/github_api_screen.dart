import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api/github_api.dart';
import 'model/issues.dart';
import 'model/pull_requests.dart';

class GithubApiScreen extends StatefulWidget {
  const GithubApiScreen({super.key});

  @override
  GithubApiState createState() => GithubApiState();
}

class GithubApiState extends State<GithubApiScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  late GithubApi githubApi;

  List<PullRequests>? _pulls;

  // List<Issues>? issues;
  List<PullRequests>? pullRequests;

  @override
  void initState() {
    super.initState();
    final dio = Dio(); // Create a Dio instance
    githubApi = GithubApi(dio); // Create the GithubApi instance
  }

  Future<void> fetchIssuesAndPullRequests() async {
    final username = userNameController.text;
    final projectName = projectNameController.text;

    // issues = await githubApi.getIssues(username, projectName);
    pullRequests = await githubApi.getPullRequests(username, projectName);
    // print('Issues: $issues');  // Add this line
    print('Pull Requests: $pullRequests'); // Add this line

    setState(() {
      _pulls = pullRequests;
    }); // データが更新されたので、UIを再構築するためにsetStateを呼び出します。
  }

  @override
  void dispose() {
    // コントローラを破棄します
    userNameController.dispose();
    projectNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHubリポジトリ情報取得'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: userNameController,
            decoration: const InputDecoration(
              hintText: 'ユーザー名入力',
            ),
          ),
          TextField(
            controller: projectNameController,
            decoration: const InputDecoration(
              hintText: 'プロジェクト名入力',
            ),
          ),
          ElevatedButton(
            onPressed: fetchIssuesAndPullRequests,
            child: const Text('検索'),
          ),
          const Text('プルリクエスト', style: TextStyle(fontSize: 40)),
          Flexible(
            child: ListView.builder(
              itemCount: _pulls?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_pulls?[index].title ?? 'プルリクエストがありません'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
