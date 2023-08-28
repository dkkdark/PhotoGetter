import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_photo_result.freezed.dart';

part 'post_photo_result.g.dart';

@freezed
class PostPhotoResult with _$PostPhotoResult {
  const factory PostPhotoResult({String? body}) = _PostPhotoResult;

  factory PostPhotoResult.fromJson(dynamic json) =>
      _$PostPhotoResultFromJson(json);
}
