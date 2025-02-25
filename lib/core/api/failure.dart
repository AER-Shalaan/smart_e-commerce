import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the API server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the API server.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Invalid SSL certificate.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled.');
      case DioExceptionType.connectionError:
        return ServerFailure('Failed to connect to the API server.');
      case DioExceptionType.unknown:
        return ServerFailure(
          dioError.message != null &&
                  dioError.message!.contains('SocketException')
              ? 'No Internet Connection'
              : 'Unexpected Error, Please try again!',
        );
    }
  }

  factory ServerFailure.fromResponse(Response? response) {
    if (response == null || response.statusCode == null) {
      return ServerFailure('Unexpected error, please try again.');
    }

    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
          response.data?['error']['message'] ?? 'Authentication error.',
        );
      case 404:
        return ServerFailure('Request not found, please try again later.');
      case 500:
        return ServerFailure('Internal server error, please try again later.');
      default:
        return ServerFailure('Oops! An error occurred, please try again.');
    }
  }
}
