import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

import "../../../core/errors/handle_error.dart";
import "../../wrappers/result_wrapper.dart";
import "app_http_client.dart";
import "http.dart";

class AppHttpClientImpl extends AppHttpClient {
  final Dio _dio;

  AppHttpClientImpl(this._dio) {
    _setupLogging();
  }

  void _setupLogging() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print("REQUEST[${options.method}] => PATH: ${options.path}");
            print("REQUEST[${options.method}] => BODY: ${options.data}");
            print(
              "REQUEST[${options.method}] => QUERY: ${options.queryParameters}",
            );
            print("HEADERS[${options.method}] => HEADERS: ${options.headers}");
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print(
              "RESPONSE[${response.statusCode}] => DATA: ${response.data is List<int> ? 'BYTES => List<int>' : response.data}",
            );
          }
          handler.next(response);
        },
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print(
              "ERROR[${e.response?.statusCode}] => MESSAGE: ${e.response?.data}",
            );
          }
          handler.next(e);
        },
      ),
    );
  }

  Future<ResultWrapper<T>> _request<T>(
    Future<Response> futureRequest,
    T Function(dynamic data) onResult,
  ) async {
    try {
      Response response = await futureRequest;

      final result = onResult(response.data);

      return ResultWrapper<T>.success(result);
    } catch (e) {
      if (e is DioException) {
        final error = HttpError.fromDioException(e);
        final baseError = handleError(error.statusCode, message: error.message);
        return ResultWrapper.error(baseError);
      } else {
        final apiError = HttpError(
          message: e.toString(),
          errorType: DioExceptionType.unknown,
        );
        final baseError = handleError(
          apiError.statusCode,
          message: apiError.message,
        );
        return ResultWrapper.error(baseError);
      }
    }
  }

  @override
  Future<ResultWrapper<T>> get<T>(
    String path, {
    required T Function(dynamic data) onResult,
    Map<String, dynamic>? queryParameters,
    bool returnBytes = false,
  }) async {
    return _request<T>(
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(responseType: returnBytes ? ResponseType.bytes : null),
      ),
      onResult,
    );
  }

  @override
  Future<ResultWrapper<T>> post<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  }) async {
    return _request<T>(_dio.post(path, data: data), onResult);
  }

  @override
  Future<ResultWrapper<T>> put<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  }) async {
    return _request<T>(_dio.put(path, data: data), onResult);
  }

  @override
  Future<ResultWrapper<T>> delete<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  }) async {
    return _request<T>(_dio.delete(path, data: data), onResult);
  }

  @override
  Future<ResultWrapper<T>> patch<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  }) async {
    return _request<T>(_dio.patch(path, data: data), onResult);
  }
}
