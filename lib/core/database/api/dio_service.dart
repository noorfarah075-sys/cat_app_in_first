import 'package:cat_app/core/database/api/api_consts.dart';
import 'package:cat_app/core/error/server_exception.dart';
import 'package:dio/dio.dart';
import 'package:cat_app/core/database/api/api_consumer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService implements ApiConsumer {
  final Dio _dio;

  DioService(this._dio) {
    _dio.options.baseUrl = ApiConsts.baseUrl;
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await _dio.get(path, queryParameters: queryParameters);
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        //good
        return res.data;
      } else {
        //bad
        throw ServerException(
          message: res.statusMessage ?? 'Server Error',
          statusCode: res.statusCode ?? 500,
          data: res.data,
        );
      }
    } catch (e) {
      throw await _handleException(e);
    }
  }

  @override
  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
  }) async {
    try {
      var res = await _dio.post(path, queryParameters: queryParameters, data: body);
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        //good
        return res.data;
      } else {
        //bad
        throw ServerException(
          message: res.statusMessage ?? 'Server Error',
          statusCode: res.statusCode ?? 500,
          data: res.data,
        );
      }
    } catch (e) {
      throw await _handleException(e);
    }
  }

  Future<ServerException> _handleException(dynamic e) async {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ServerException(
            message: "Connection Timeout",
            statusCode: 408,
          );
        case DioExceptionType.sendTimeout:
          return ServerException(
            message: "Send Timeout",
            statusCode: 408,
          );
        case DioExceptionType.receiveTimeout:
          return ServerException(
            message: "Receive Timeout",
            statusCode: 500,
          );
        case DioExceptionType.badCertificate:
          return ServerException(
            message: "Bad Certificate",
            statusCode: 500,
          );
        case DioExceptionType.badResponse:
          return ServerException(
            message: e.response?.statusMessage ?? "Bad Response",
            statusCode: e.response?.statusCode ?? 500,
            data: e.response?.data,
          );
        case DioExceptionType.cancel:
          return ServerException(
            message: "Request Canceled",
            statusCode: 500,
          );
        case DioExceptionType.connectionError:
          return ServerException(
            message: "Connection Error",
            statusCode: 408,
          );
        case DioExceptionType.unknown:
          return ServerException(
            message: "Unknown Error",
            statusCode: 500,
          );
        default:
          return ServerException(
            message: "Something went wrong",
            statusCode: 500,
          );
      }
    } else {
      return ServerException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }
}
