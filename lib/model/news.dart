import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
@immutable
class News{
  const News({
  this.title,
  this.url,
});

factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

final String? title;
final String? url;

Map<String, dynamic> toJson() => _$NewsToJson(this);


  @override
  String toString() {
    return 'News{title: $title, url: $url}';  // News モデルが持つ他のプロパティも表示させることができます
  }
}
