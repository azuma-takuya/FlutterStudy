// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResult _$NewsResultFromJson(Map<String, dynamic> json) => NewsResult(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsResultToJson(NewsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
