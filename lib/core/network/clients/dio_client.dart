import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reel_vault/core/network/interceptors/api_key_interceptor.dart';
import 'package:reel_vault/core/network/interceptors/talker_logger.dart';
import 'package:reel_vault/core/network/network_constants.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Dio get instance {
    _dio ??= _createDio();
    return _dio!;
  }

  static Dio get dio => instance;

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
        headers: NetworkConstants.defaultHeaders,
      ),
    );

    // Logging interceptor (Talker)
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          talker: TalkerLogger.instance,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      );
    }

    dio.interceptors.add(ApiKeyInterceptor());

    return dio;
  }
}
