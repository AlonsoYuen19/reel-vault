class NetworkConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  
  // Carga la API Key desde variables de entorno, usando la key de desarrollo por defecto.
  static const String apiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue: '18b7a2626730737a6f397f8475bab471',
  );

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
