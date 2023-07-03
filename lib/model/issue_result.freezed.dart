// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IssueResult _$IssueResultFromJson(Map<String, dynamic> json) {
  return _IssueResult.fromJson(json);
}

/// @nodoc
mixin _$IssueResult {
  int? get totalCount => throw _privateConstructorUsedError;
  bool? get incompleteResults => throw _privateConstructorUsedError;
  List<Issues>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssueResultCopyWith<IssueResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueResultCopyWith<$Res> {
  factory $IssueResultCopyWith(
          IssueResult value, $Res Function(IssueResult) then) =
      _$IssueResultCopyWithImpl<$Res, IssueResult>;
  @useResult
  $Res call({int? totalCount, bool? incompleteResults, List<Issues>? items});
}

/// @nodoc
class _$IssueResultCopyWithImpl<$Res, $Val extends IssueResult>
    implements $IssueResultCopyWith<$Res> {
  _$IssueResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      incompleteResults: freezed == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Issues>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IssueResultCopyWith<$Res>
    implements $IssueResultCopyWith<$Res> {
  factory _$$_IssueResultCopyWith(
          _$_IssueResult value, $Res Function(_$_IssueResult) then) =
      __$$_IssueResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, bool? incompleteResults, List<Issues>? items});
}

/// @nodoc
class __$$_IssueResultCopyWithImpl<$Res>
    extends _$IssueResultCopyWithImpl<$Res, _$_IssueResult>
    implements _$$_IssueResultCopyWith<$Res> {
  __$$_IssueResultCopyWithImpl(
      _$_IssueResult _value, $Res Function(_$_IssueResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_IssueResult(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      incompleteResults: freezed == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Issues>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IssueResult implements _IssueResult {
  const _$_IssueResult(
      {required this.totalCount,
      required this.incompleteResults,
      required final List<Issues>? items})
      : _items = items;

  factory _$_IssueResult.fromJson(Map<String, dynamic> json) =>
      _$$_IssueResultFromJson(json);

  @override
  final int? totalCount;
  @override
  final bool? incompleteResults;
  final List<Issues>? _items;
  @override
  List<Issues>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IssueResult(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IssueResult &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, incompleteResults,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IssueResultCopyWith<_$_IssueResult> get copyWith =>
      __$$_IssueResultCopyWithImpl<_$_IssueResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IssueResultToJson(
      this,
    );
  }
}

abstract class _IssueResult implements IssueResult {
  const factory _IssueResult(
      {required final int? totalCount,
      required final bool? incompleteResults,
      required final List<Issues>? items}) = _$_IssueResult;

  factory _IssueResult.fromJson(Map<String, dynamic> json) =
      _$_IssueResult.fromJson;

  @override
  int? get totalCount;
  @override
  bool? get incompleteResults;
  @override
  List<Issues>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_IssueResultCopyWith<_$_IssueResult> get copyWith =>
      throw _privateConstructorUsedError;
}
