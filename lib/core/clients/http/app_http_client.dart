import "package:bus2_teste_tecnico/core/wrappers/result_wrapper.dart";

abstract class AppHttpClient {
  Future<ResultWrapper<T>> get<T>(
    String path, {
    required T Function(dynamic data) onResult,
    Map<String, dynamic>? queryParameters,
    bool returnBytes = false,
  });

  Future<ResultWrapper<T>> post<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  });

  Future<ResultWrapper<T>> put<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  });

  Future<ResultWrapper<T>> delete<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  });

  Future<ResultWrapper<T>> patch<T>(
    String path, {
    required T Function(dynamic data) onResult,
    dynamic data,
  });
}
