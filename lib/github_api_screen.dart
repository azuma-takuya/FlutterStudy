import 'package:countup/model/issue_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api/github_api.dart';
import 'model/pull_requests.dart';

class GithubApiScreen extends StatefulWidget {
  const GithubApiScreen({super.key});

  @override
  GithubApiState createState() => GithubApiState();
}

class GithubApiState extends State<GithubApiScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController repositoryController = TextEditingController();
  late GithubApi githubApi;

  List<PullRequests>? _pullsResult;
  List<PullRequests>? getPulls;

  IssueResult? _issuesResult;

  @override
  void initState() {
    super.initState();
    final dio = Dio(); // Create a Dio instance
    githubApi = GithubApi(dio); // Create the GithubApi instance
  }

  Future<void> fetchIssuesAndPullRequests() async {
    final user = userController.text;
    final repo = repositoryController.text;

    //ここの宣言があると動かない
    final getIssuesResult = await githubApi.getIssues('repo:$user/$repo+is:issue');
    getPulls = await githubApi.getPullRequests(user, repo);

    setState(() {
      _pullsResult = getPulls;
      _issuesResult = getIssuesResult;
    }); // データが更新されたので、UIを再構築するためにsetStateを呼び出します。
  }

  @override
  void dispose() {
    // コントローラを破棄します
    userController.dispose();
    repositoryController.dispose();
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
            controller: userController,
            decoration: const InputDecoration(
              hintText: 'ユーザー名入力',
            ),
          ),
          TextField(
            controller: repositoryController,
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
              itemCount: _pullsResult?.isEmpty ?? true ? 1 : _pullsResult!
                  .length,
              itemBuilder: (context, index) {
                if (_pullsResult == null || _pullsResult!.isEmpty) {
                  return const ListTile(
                    title: Text('プルリクエストがありません'),
                  );
                } else {
                  return ListTile(
                    title: Text(_pullsResult![index].title),
                  );
                }
              },
            ),
          ),
          const Text('Issues', style: TextStyle(fontSize: 40)),
          Flexible(
            child: ListView.builder(
              itemCount: _issuesResult?.items?.length ?? 0,
              itemBuilder: (context, index) {
                if (_issuesResult == null) {
                  return const ListTile(
                    title: Text('Issuesがありません'),
                  );
                } else {
                  final title = _issuesResult?.items?[index].title ;
                  return ListTile(
                    title: Text(title ?? 'Issuesがありません'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
