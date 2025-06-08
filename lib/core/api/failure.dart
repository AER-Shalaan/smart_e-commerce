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
        return ServerFailure(
          'The server took too long to respond. Please try again.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          'Sending data took too long. Please try again later.',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure('The server took too long to send a response.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
          'The connection is not secure. Please try again later.',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response);
      case DioExceptionType.cancel:
        return ServerFailure(
          'The request was cancelled. Please check your connection and try again.',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          'Failed to connect to the server. Please check your internet connection.',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          dioError.message?.contains('SocketException') == true
              ? 'No internet connection.'
              : 'An unexpected error occurred. Please try again.',
        );
    }
  }
  factory ServerFailure.fromResponse(Response? response) {
    if (response == null || response.statusCode == null) {
      return ServerFailure('Something went wrong. Please try again.');
    }

    dynamic data = response.data;
    String? message;

    if (data is Map<String, dynamic>) {
      final error = data['error'];
      message =
          (error is Map && error['message'] is String)
              ? error['message']
              : data['message']?.toString() ??
                  data['error_description']?.toString() ??
                  data['detail']?.toString();
    }

    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
          message ?? 'Authentication failed. Please check your credentials.',
        );
      case 404:
        return ServerFailure('The requested resource was not found.');
      case 500:
        return ServerFailure('Server error occurred. Please try again later.');
      default:
        return ServerFailure(message ?? 'An error occurred. Please try again.');
    }
  }
}
