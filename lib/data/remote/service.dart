import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PhotoService {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://photogetter.free.beeceptor.com',
      responseType: ResponseType.json,
    ),
  );

  Future<int?> postPhoto({
    required String id, required String path,
    required String filename, required String comment,
    required double? lat, required double? long
}) async {
    debugPrint("comment $comment");
    var formData = FormData.fromMap({
      "id": id,
      "file": await MultipartFile.fromFile(path, filename: filename),
      "comment": comment,
      "lat": lat,
      "long": long
    });
    try {
      final request = await _dio.post('/post-photo', data: formData);
      return request.statusCode;
    } catch (e) {
      debugPrint("postPhoto err ${e}");
      rethrow;
    }
  }
}
