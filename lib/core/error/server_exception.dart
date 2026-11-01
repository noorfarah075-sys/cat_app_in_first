class ServerException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic>? data;
  const ServerException({
    required this.message,
    required this.statusCode,
    this.data
  }
  );
}