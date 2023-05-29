import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pull_requests.freezed.dart';
part 'pull_requests.g.dart';

// モデル定義
@freezed
class PullRequests with _$PullRequests {
  const PullRequests._(); // メソッドを追加するので、コンストラクタを追加
  const factory PullRequests({required String name}) = _PullRequests;

  factory PullRequests.fromJson(Map<String, dynamic> json) => _$PullRequestsFromJson(json);
  // クラスメソッドに、fromJsonStrメソッドを追加
  // factory PullRequests.fromJsonStr(String jsonStr) => _$PullRequestsFromJson(json.decode(jsonStr));

  String toJsonStr() {
    return json.encode(toJson());
  }
}