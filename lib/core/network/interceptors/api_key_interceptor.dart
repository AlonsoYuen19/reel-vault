import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/network_constants.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = NetworkConstants.apiKey;
    handler.next(options);
  }
}
