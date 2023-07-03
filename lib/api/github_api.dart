import 'package:countup/model/issue_result.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/pull_requests.dart';

part 'github_api.g.dart';

@RestApi(baseUrl: 'https://api.github.com')
abstract class GithubApi {
  factory GithubApi(Dio dio, {String baseUrl}) = _GithubApi;

  // @queryで値を取得
  @GET('/search/issues')
  Future<IssueResult> getIssues(
      @Query('q') String query,
      );

  @GET('/repos/{user}/{repo}/pulls')
  Future<List<PullRequests>> getPullRequests(
      @Path('user') String owner,
      @Path('repo') String repo,
      );
}
