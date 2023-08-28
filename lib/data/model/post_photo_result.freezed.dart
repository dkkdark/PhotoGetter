// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_photo_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostPhotoResult _$PostPhotoResultFromJson(Map<String, dynamic> json) {
  return _PostPhotoResult.fromJson(json);
}

/// @nodoc
mixin _$PostPhotoResult {
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostPhotoResultCopyWith<PostPhotoResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPhotoResultCopyWith<$Res> {
  factory $PostPhotoResultCopyWith(
          PostPhotoResult value, $Res Function(PostPhotoResult) then) =
      _$PostPhotoResultCopyWithImpl<$Res, PostPhotoResult>;
  @useResult
  $Res call({String? body});
}

/// @nodoc
class _$PostPhotoResultCopyWithImpl<$Res, $Val extends PostPhotoResult>
    implements $PostPhotoResultCopyWith<$Res> {
  _$PostPhotoResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostPhotoResultCopyWith<$Res>
    implements $PostPhotoResultCopyWith<$Res> {
  factory _$$_PostPhotoResultCopyWith(
          _$_PostPhotoResult value, $Res Function(_$_PostPhotoResult) then) =
      __$$_PostPhotoResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? body});
}

/// @nodoc
class __$$_PostPhotoResultCopyWithImpl<$Res>
    extends _$PostPhotoResultCopyWithImpl<$Res, _$_PostPhotoResult>
    implements _$$_PostPhotoResultCopyWith<$Res> {
  __$$_PostPhotoResultCopyWithImpl(
      _$_PostPhotoResult _value, $Res Function(_$_PostPhotoResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$_PostPhotoResult(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostPhotoResult implements _PostPhotoResult {
  const _$_PostPhotoResult({this.body});

  factory _$_PostPhotoResult.fromJson(Map<String, dynamic> json) =>
      _$$_PostPhotoResultFromJson(json);

  @override
  final String? body;

  @override
  String toString() {
    return 'PostPhotoResult(body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostPhotoResult &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostPhotoResultCopyWith<_$_PostPhotoResult> get copyWith =>
      __$$_PostPhotoResultCopyWithImpl<_$_PostPhotoResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostPhotoResultToJson(
      this,
    );
  }
}

abstract class _PostPhotoResult implements PostPhotoResult {
  const factory _PostPhotoResult({final String? body}) = _$_PostPhotoResult;

  factory _PostPhotoResult.fromJson(Map<String, dynamic> json) =
      _$_PostPhotoResult.fromJson;

  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$$_PostPhotoResultCopyWith<_$_PostPhotoResult> get copyWith =>
      throw _privateConstructorUsedError;
}
