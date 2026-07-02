import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  factory AppException.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const TimeoutException(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return const TimeoutException(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return const TimeoutException(message: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return const ServerException(message: 'Bad certificate');
      case DioExceptionType.badResponse:
        final responseData = error.response?.data;
        final message = responseData is Map<String, dynamic> && responseData.containsKey('status_message')
            ? responseData['status_message'] as String
            : 'Bad response';
        return ServerException(message: message, statusCode: error.response?.statusCode);
      case DioExceptionType.cancel:
        return const ServerException(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return const NetworkException(message: 'Connection error');
      case DioExceptionType.transformTimeout:
        return const TimeoutException(message: 'Transforma timeout');
      case DioExceptionType.unknown:
        return const UnexpectedException(message: 'Unexpected error');
    }
  }
  final String message;
  final int? statusCode;

  @override
  String toString() {
    return 'AppException(message: $message, statusCode: $statusCode)';
  }
}

class ServerException extends AppException {
  const ServerException({required String message, int? statusCode}) : super(message, statusCode: statusCode);
}

class NetworkException extends AppException {
  const NetworkException({required String message}) : super(message);
}

class TimeoutException extends AppException {
  const TimeoutException({required String message}) : super(message);
}

class UnexpectedException extends AppException {
  const UnexpectedException({required String message}) : super(message);
}
