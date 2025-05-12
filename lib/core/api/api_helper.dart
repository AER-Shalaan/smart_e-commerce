import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_ecommerce/core/api/failure.dart';

class ApiHelper {
  static Future<Either<Failure, Response>> safeGet(
    Dio dio,
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  static Future<Either<Failure, Response>> safePost(
    Dio dio,
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  static Future<Either<Failure, Response>> safePut(
    Dio dio,
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  static Future<Either<Failure, Response>> safeDelete(
    Dio dio,
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
