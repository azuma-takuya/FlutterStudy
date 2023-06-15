import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'news.dart';

part 'news_result.g.dart';

@JsonSerializable()
@immutable
class NewsResult {
  const NewsResult({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResult.fromJson(Map<String, dynamic> json) =>
      _$NewsResultFromJson(json);

  final String? status;
  final int? totalResults;
  final List<News>? articles;

  Map<String, dynamic> toJson() => _$NewsResultToJson(this);
}
