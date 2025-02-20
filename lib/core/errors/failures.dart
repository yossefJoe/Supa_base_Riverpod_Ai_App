import 'package:dio/dio.dart';

/// Base class for handling application failures.
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

/// Handles server-related failures using Dio errors.
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  /// Factory constructor to create [ServerFailure] from a [DioError].
  factory ServerFailure.fromDioError(DioError dioError) {
    // Optional: Log the DioError for debugging
    // print("DioError: ${dioError.type}, Message: ${dioError.message}");

    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server.');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with the API server.');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout from the API server.');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioErrorType.cancel:
        return ServerFailure('Request to the API server was canceled.');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(
              'No Internet Connection. Please check your network.');
        }
        return ServerFailure('Unexpected error occurred. Please try again.');

      default:
        return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  /// Factory constructor to create [ServerFailure] from HTTP response details.
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unexpected error occurred. Please try again.');
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
            response?['error'] ?? 'Authentication error occurred.');

      case 404:
        return ServerFailure('Resource not found. Please try later.');

      case 500:
        return ServerFailure('Internal server error. Please try again later.');

      default:
        return ServerFailure(
            'An error occurred (Code: $statusCode). Please try again.');
    }
  }
}
