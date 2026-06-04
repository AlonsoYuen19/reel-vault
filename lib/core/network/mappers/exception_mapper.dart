import 'package:reel_vault/core/network/failures/failure.dart';
import 'package:reel_vault/core/network/network.dart';

class ExceptionMapper {
  const ExceptionMapper._();
  static Failure toFailure(AppException exception) {
    return switch (exception) {
      ServerException(:final message, :final statusCode) => Failure.server(
        message: message,
        statusCode: statusCode,
      ),
      NetworkException(:final message) || TimeoutException(:final message) => Failure.network(message: message),
      _ => Failure.unknown(message: exception.message),
    };
  }
}
