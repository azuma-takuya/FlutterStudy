import 'package:json_annotation/json_annotation.dart';

part 'pull_requests.g.dart';


@JsonSerializable()
class PullRequest {
  final int id;
  final String title;
  final String body;

  PullRequest({required this.id, required this.title, required this.body});

  factory PullRequest.fromJson(Map<String, dynamic> json) => _$PullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PullRequestToJson(this);
}
