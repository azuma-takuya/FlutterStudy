import 'package:countup/model/issue_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api/github_api.dart';
import 'model/pull_requests.dart';

class GithubApiScreen extends StatefulWidget {
  const GithubApiScreen({super.key});

  @override
  State<GithubApiScreen> createState() => GithubApiState();
}

class GithubApiState extends State<GithubApiScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController repositoryController = TextEditingController();
  late GithubApi githubApi;

  List<PullRequests>? _pullResult;
  List<PullRequests>? getPull;

  IssueResult? _issueResult;

  @override
  void initState() {
    super.initState();
    final dio = Dio(); // Create a Dio instance
    githubApi = GithubApi(dio); // Create the GithubApi instance
  }

  Future<void> fetchIssuesAndPullRequests() async {
    final user = userController.text;
    final repo = repositoryController.text;

    await Future.wait([
      githubApi.getIssues('repo:$user/$repo is:issue',),
      githubApi.getPullRequests(user, repo),]).then(
            (apiResult) {
          setState(() {
            _issueResult = apiResult[0] as IssueResult?;
            _pullResult = apiResult[1] as List<PullRequests>?;
          });
        },
        onError: (dynamic e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('リポジトリ情報が取得できません: $e'),
              duration: const Duration(seconds: 3),
            ),
          );
        },
    );
  }

        @override
        void dispose()
    {
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
            const Text('PullRequest', style: TextStyle(fontSize: 40)),
            Flexible(
              child: ListView.builder(
                itemCount: _pullResult?.length ?? 0,
                itemBuilder: (context, index) {
                  final pullRequest = _pullResult?[index];
                  if (pullRequest == null || _pullResult!.isEmpty) {
                    return const ListTile(
                      title: Text('PullRequestがありません'),
                    );
                  } else {
                    return ListTile(
                      title: Text(pullRequest.title),
                    );
                  }
                },
              ),
            ),
            const Text('Issues', style: TextStyle(fontSize: 40)),
            Flexible(
              child: ListView.builder(
                itemCount: _issueResult?.items?.length ?? 0,
                itemBuilder: (context, index) {
                  final issueTitle = _issueResult?.items?[index].title;
                  if (_issueResult == null || _pullResult!.isEmpty) {
                    return const ListTile(
                      title: Text('Issueがありません'),
                    );
                  } else {
                    return ListTile(
                      title: Text(issueTitle ?? 'Issuesがありません'),
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
