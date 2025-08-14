import 'package:dio/dio.dart';
import 'package:testtree/core/contains.dart';
import 'package:testtree/model/tree.dart';

class TreeService {
  TreeService(_);
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Contains.baseUrl,
      contentType: 'application/json',
    )
  );
  Future<void> getTree(int id) async{
    final response = await _dio.get('/tree/result/$id');
  }
}