import 'dart:io';
import 'package:dio/dio.dart';
import 'package:testtree/core/contains.dart';
import 'package:testtree/model/tree.dart';

class TreeService {
  static final Dio _dio = Dio(BaseOptions(baseUrl: Contains.baseUrl));

  static Future<Tree> postTree(File imageFile) async {
    final fileName = imageFile.path.split('/').last;

    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });

    final response = await _dio.post(
      '/tree/upload/',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return Tree.fromJson(response.data);
  }

  static Future<Tree> getTree(int id) async {
    final response = await _dio.get('/tree/result/$id');
    return Tree.fromJson(response.data);
  }
}
