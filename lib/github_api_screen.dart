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
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  // final Dio dio = Dio();
  late GithubApi githubApi;

  List<Issues>? issues;
  List<PullRequests>? pullRequests;

  Future<void> fetchIssuesAndPullRequests() async {
    print('githubApi: $githubApi');
    String username = controller1.text;
    String projectName = controller2.text;

    issues = await githubApi.getIssues(username, projectName);
    pullRequests = await githubApi.getPullRequests(username, projectName);
    setState(() {}); // データが更新されたので、UIを再構築するためにsetStateを呼び出します。
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
            onPressed: fetchIssuesAndPullRequests,
            child: Text('検索'),
          ),
          if (issues != null) Text('取得したIssue: ${issues!.length}'),
          // ここでissuesを表示します。
          if (pullRequests != null)
            Text('取得したPullRequest: ${pullRequests!.length}'),
          // ここでpullRequestsを表示します。
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class GithubApiScreen extends StatefulWidget {
//   const GithubApiScreen({super.key});
//
//   @override
//   GithubApiState createState() => GithubApiState();
// }
//
// class GithubApiState extends State<GithubApiScreen> {
//   final TextEditingController controller1 = TextEditingController();
//   final TextEditingController controller2 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GItリポジトリ情報取得'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             controller: controller1,
//             decoration: const InputDecoration(
//               hintText: 'ユーザー名入力',
//             ),
//           ),
//           TextField(
//             controller: controller2,
//             decoration: const InputDecoration(
//               hintText: 'プロジェクト名入力',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // 検索ボタンが押されたときの処理
//             },
//             child: const Text('検索'),
//           ),
//         ],
//       ),
//     );
//   }
// }
