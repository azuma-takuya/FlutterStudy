import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'issues.freezed.dart';
part 'issues.g.dart';

// モデル定義
@freezed
class Issues with _$Issues {
  // const Issues._(); // メソッドを追加するので、コンストラクタを追加
  const factory Issues({required String title}) = _Issues;

  factory Issues.fromJson(Map<String, dynamic> json) => _$IssuesFromJson(json);
}
