import "package:dio/dio.dart";

class HttpResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, dynamic>? headers;

  HttpResponse({this.data, this.statusCode, this.statusMessage, this.headers});

  factory HttpResponse.fromDioResponse(Response<T> response) {
    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers.map,
    );
  }
}

class HttpError {
  final String message;
  final int? statusCode;
  final DioExceptionType errorType;
  final dynamic errorData;

  HttpError({
    required this.message,
    required this.errorType,
    this.statusCode,
    this.errorData,
  });

  factory HttpError.fromDioException(DioException dioException) {
    return HttpError(
      message: dioException.message ?? "",
      statusCode: dioException.response?.statusCode,
      errorType: dioException.type,
      errorData: dioException.response?.data,
    );
  }
}
