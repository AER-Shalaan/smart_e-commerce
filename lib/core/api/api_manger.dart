import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_helper.dart';
import 'failure.dart';
import '../constants.dart';

@singleton
class ApiManger {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
      ),
    );
  }

  Future<Either<Failure, Response>> getRequest({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
    required String token,
  }) async {
    return await ApiHelper.safeGet(
      dio,
      endPoints,
      queryParams: queryParameters,
      headers: {'Authorization': "Bearer $token"},
    );
  }

  Future<Either<Failure, Response>> postRequest({
    required String endPoints,
    Map<String, dynamic>? body,
  }) async {
    return await ApiHelper.safePost(
      dio,
      endPoints,
      body: body,
    );
  }

  Future<Either<Failure, Response>> postRequestForHme({
    required String endPoints,
    Map<String, dynamic>? body,
    required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await ApiHelper.safePost(
      dio,
      endPoints,
      body: body,
      headers: {'Authorization': "Bearer $token"},
      queryParams: queryParameters,
    );
  }
}
