class NetworkConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  
  // TODO: Mover esto a un lugar más seguro después (nunca hardcodear en producción real)
  static const String apiKey = '18b7a2626730737a6f397f8475bab471';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
