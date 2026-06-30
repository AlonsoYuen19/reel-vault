class NetworkConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  
  // Carga la API Key de TMDb desde las variables de entorno al compilar.
  static const String apiKey = String.fromEnvironment('TMDB_API_KEY');

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
