import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'issues.freezed.dart';
part 'issues.g.dart';

// モデル定義
@freezed
class Issues with _$Issues {
  const Issues._(); // メソッドを追加するので、コンストラクタを追加
  const factory Issues({required String name}) = _Issues;

  factory Issues.fromJson(Map<String, dynamic> json) => _$IssuesFromJson(json);
  // クラスメソッドに、fromJsonStrメソッドを追加
  factory Issues.fromJsonStr(String jsonStr) => _$IssuesFromJson(json.decode(jsonStr));

  String toJsonStr() {
    return json.encode(toJson());
  }
}

// // user.dart
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
//
// part 'user.freezed.dart';
// part 'user.g.dart';
//
// @freezed
// abstract class User with _$User {
//   const factory User({String name, int age}) = _User;
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }