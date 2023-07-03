import 'package:freezed_annotation/freezed_annotation.dart';
import 'issues.dart';

part 'issue_result.freezed.dart';

part 'issue_result.g.dart';

@freezed
class IssueResult with _$IssueResult {
  const factory IssueResult({
    required int? totalCount,
    required bool? incompleteResults,
    required List<Issues>? items,
  }) = _IssueResult;

  factory IssueResult.fromJson(Map<String, dynamic> json) =>
      _$IssueResultFromJson(json);
}
