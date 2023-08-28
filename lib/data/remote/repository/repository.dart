import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_getter/data/remote/exceptions.dart';
import 'package:photo_getter/data/remote/service.dart';
import 'package:uuid/uuid.dart';

import '../../model/post_photo_result.dart';

class PhotoRepository {
  final PhotoService _predApi;

  PhotoRepository(this._predApi);

  Future<PostPhotoResult> postPhoto(
      {required XFile? file,
      required String comment,
      required double? lat,
      required double? long}) async {
    try {
      debugPrint("postPhoto repository called");
      if (file?.path == "" || file?.path == null || file == null) {
        throw WrongPathException();
      }
      String path = file.path;
      String uuid = const Uuid().v4();
      String filename = file.name;

      final res = await _predApi.postPhoto(
          id: uuid,
          path: path,
          filename: filename,
          comment: comment,
          lat: lat,
          long: long);

      if (res == 200) {
        return const PostPhotoResult(body: "Image was loaded!");
      }
      throw InvalidResponse();
    } on WrongPathException {
      debugPrint("path was null");
      return const PostPhotoResult(
          body: "Image wasn't loaded due to incorrect data");
    } on InvalidResponse {
      debugPrint("server error");
      return const PostPhotoResult(
          body: "Image wasn't loaded due to server problem");
    } catch (e) {
      debugPrint(e.toString());
      return const PostPhotoResult(
          body: "Image wasn't loaded due to some error");
    }
  }
}
