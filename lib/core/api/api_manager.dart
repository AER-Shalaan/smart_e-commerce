import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'api_helper.dart';
import 'failure.dart';
import '../constants.dart';

@singleton
class ApiManger {
  static late Dio dio;
  static late Dio dio2;
  static late Dio dio3;

  static init() {
    dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));
    dio2 = Dio(BaseOptions(baseUrl: Constants.baseUrl2));
    dio3 = Dio(BaseOptions(baseUrl: Constants.baseUrl3));
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
    return await ApiHelper.safePost(dio, endPoints, body: body);
  }

  Future<Either<Failure, Response>> postRequestAI({
    required String endPoints,
    Map<String, dynamic>? body,
  }) async {
    return await ApiHelper.safePost(dio3, endPoints, body: body);
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

  Future<Either<Failure, Response>> deleteRequest({
    required String endPoints,
    required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await ApiHelper.safeDelete(
      dio,
      endPoints,
      headers: {'Authorization': "Bearer $token"},
      queryParams: queryParameters,
    );
  }

  Future<Either<Failure, Response>> putRequest({
    required String endPoints,
    required String token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await ApiHelper.safePut(
      dio,
      endPoints,
      body: body,
      headers: {'Authorization': "Bearer $token"},
      queryParams: queryParameters,
    );
  }

  Future<Either<Failure, Response>> sendChatMessage(String message) async {
    return await ApiHelper.safePost(
      dio,
      EndPoints.sendChatMessageEndPoint,
      body: {"message": message},
    );
  }

  Future<Either<Failure, Response>> getRecommendedListRequest({
    Map<String, dynamic>? queryParameters,
  }) async {
    return await ApiHelper.safeGet(
      dio2,
      EndPoints.getRecommendedList,
      queryParams: queryParameters,
    );
  }
}
