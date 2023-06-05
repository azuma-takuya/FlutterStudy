// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pull_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PullRequests _$PullRequestsFromJson(Map<String, dynamic> json) {
  return _PullRequests.fromJson(json);
}

/// @nodoc
mixin _$PullRequests {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PullRequestsCopyWith<PullRequests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullRequestsCopyWith<$Res> {
  factory $PullRequestsCopyWith(
          PullRequests value, $Res Function(PullRequests) then) =
      _$PullRequestsCopyWithImpl<$Res, PullRequests>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$PullRequestsCopyWithImpl<$Res, $Val extends PullRequests>
    implements $PullRequestsCopyWith<$Res> {
  _$PullRequestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PullRequestsCopyWith<$Res>
    implements $PullRequestsCopyWith<$Res> {
  factory _$$_PullRequestsCopyWith(
          _$_PullRequests value, $Res Function(_$_PullRequests) then) =
      __$$_PullRequestsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_PullRequestsCopyWithImpl<$Res>
    extends _$PullRequestsCopyWithImpl<$Res, _$_PullRequests>
    implements _$$_PullRequestsCopyWith<$Res> {
  __$$_PullRequestsCopyWithImpl(
      _$_PullRequests _value, $Res Function(_$_PullRequests) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_PullRequests(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PullRequests with DiagnosticableTreeMixin implements _PullRequests {
  const _$_PullRequests({required this.title});

  factory _$_PullRequests.fromJson(Map<String, dynamic> json) =>
      _$$_PullRequestsFromJson(json);

  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PullRequests(title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PullRequests'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PullRequests &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PullRequestsCopyWith<_$_PullRequests> get copyWith =>
      __$$_PullRequestsCopyWithImpl<_$_PullRequests>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PullRequestsToJson(
      this,
    );
  }
}

abstract class _PullRequests implements PullRequests {
  const factory _PullRequests({required final String title}) = _$_PullRequests;

  factory _PullRequests.fromJson(Map<String, dynamic> json) =
      _$_PullRequests.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_PullRequestsCopyWith<_$_PullRequests> get copyWith =>
      throw _privateConstructorUsedError;
}
