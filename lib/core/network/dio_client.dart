import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/network_constants.dart';
import 'package:reel_vault/core/network/talker_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Dio get instance {
    _dio ??= _createDio();
    return _dio!;
  }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
        headers: NetworkConstants.defaultHeaders,
      ),
    );

    dio.interceptors.add(
      TalkerDioLogger(
        talker: TalkerLogger.instance,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
        ),
      ),
    );

    return dio;
  }
}