import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_state.freezed.dart';


@freezed
class PhotoState with _$PhotoState {
  factory PhotoState({
    String? message,
    @Default(false) bool isLoading,
  }) = _PhotoState;
}