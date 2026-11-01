abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
  });
}