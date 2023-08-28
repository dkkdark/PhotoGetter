import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_getter/data/remote/service.dart';
import 'package:photo_getter/domain/state/photo_state.dart';

import '../../data/remote/repository/repository.dart';

final photoApiProvider = Provider<PhotoService>((ref) {
  return PhotoService();
});

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepository(ref.read(photoApiProvider));
});

final photoDataProvider =
    StateNotifierProvider.autoDispose<PhotoDataNotifier, PhotoState>((ref) {
  return PhotoDataNotifier(ref.read(photoRepositoryProvider));
});

class PhotoDataNotifier extends StateNotifier<PhotoState> {
  PhotoDataNotifier(this.photoRepository) : super(PhotoState());
  PhotoRepository photoRepository;

  Future<void> sendPhoto(
      XFile? file, String comment, double? lat, double? long) async {
    debugPrint("sendPhoto called");
    state = state.copyWith(isLoading: true);
    await photoRepository
        .postPhoto(file: file, comment: comment, lat: lat, long: long)
        .then((data) {
      debugPrint("result of sendPhoto: ${data.body}");
      state = state.copyWith(message: data.body, isLoading: false);
    });
  }
}
