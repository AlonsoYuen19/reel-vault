import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reel_vault/core/network/network_constants.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (NetworkConstants.apiKey.isEmpty) {
      debugPrint(
        'CONFIGURATION ERROR: La API Key de TMDb no está configurada.\n'
        'Asegúrate de agregar TMDB_API_KEY a tu archivo .env y ejecutar la app '
        'con --dart-define-from-file=.env',
      );

      handler.reject(
        DioException(
          requestOptions: options,
          error: 'No se pudo conectar con el servicio de películas. Por favor, inténtalo de nuevo más tarde.',
        ),
      );
      return;
    }
    options.queryParameters['api_key'] = NetworkConstants.apiKey;
    handler.next(options);
  }
}
