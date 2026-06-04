import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure implements Exception {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.cache({required String message}) = CacheFailure;

  const factory Failure.unknown({required String message}) = UnknownFailure;
}
