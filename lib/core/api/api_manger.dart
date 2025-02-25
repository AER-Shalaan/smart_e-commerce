import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';

@singleton
class ApiManger {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        // headers: {"Authorization": ""},
      ),
    );
  }

  Future<Response> getRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postRequest(
      {required String endPoints, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoints, data: body);
    return response;
  }
}
