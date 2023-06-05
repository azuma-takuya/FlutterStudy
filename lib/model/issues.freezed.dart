// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issues.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Issues _$IssuesFromJson(Map<String, dynamic> json) {
  return _Issues.fromJson(json);
}

/// @nodoc
mixin _$Issues {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssuesCopyWith<Issues> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesCopyWith<$Res> {
  factory $IssuesCopyWith(Issues value, $Res Function(Issues) then) =
      _$IssuesCopyWithImpl<$Res, Issues>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$IssuesCopyWithImpl<$Res, $Val extends Issues>
    implements $IssuesCopyWith<$Res> {
  _$IssuesCopyWithImpl(this._value, this._then);

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
abstract class _$$_IssuesCopyWith<$Res> implements $IssuesCopyWith<$Res> {
  factory _$$_IssuesCopyWith(_$_Issues value, $Res Function(_$_Issues) then) =
      __$$_IssuesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_IssuesCopyWithImpl<$Res>
    extends _$IssuesCopyWithImpl<$Res, _$_Issues>
    implements _$$_IssuesCopyWith<$Res> {
  __$$_IssuesCopyWithImpl(_$_Issues _value, $Res Function(_$_Issues) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_Issues(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Issues with DiagnosticableTreeMixin implements _Issues {
  const _$_Issues({required this.title});

  factory _$_Issues.fromJson(Map<String, dynamic> json) =>
      _$$_IssuesFromJson(json);

  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Issues(title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Issues'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Issues &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IssuesCopyWith<_$_Issues> get copyWith =>
      __$$_IssuesCopyWithImpl<_$_Issues>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IssuesToJson(
      this,
    );
  }
}

abstract class _Issues implements Issues {
  const factory _Issues({required final String title}) = _$_Issues;

  factory _Issues.fromJson(Map<String, dynamic> json) = _$_Issues.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_IssuesCopyWith<_$_Issues> get copyWith =>
      throw _privateConstructorUsedError;
}
