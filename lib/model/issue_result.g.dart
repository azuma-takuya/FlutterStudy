// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IssueResult _$$_IssueResultFromJson(Map<String, dynamic> json) =>
    _$_IssueResult(
      totalCount: json['totalCount'] as int?,
      incompleteResults: json['incompleteResults'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Issues.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IssueResultToJson(_$_IssueResult instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'incompleteResults': instance.incompleteResults,
      'items': instance.items,
    };
