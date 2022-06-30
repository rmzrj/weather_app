import 'package:dio/dio.dart' show BaseOptions, Dio, Headers, ResponseType;

import 'interceptors/api_exception_interceptor.dart';

class DioInstance {
  late final Dio _dio;

  DioInstance() {
    final BaseOptions baseOptions = BaseOptions(
      headers: <String, dynamic>{'Authorization': '<token>'},
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
      connectTimeout: 60000, // 60s
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.addAll(
      [
        // getIt<SimpleExceptionRetryInterceptor>(),
        ApiExceptionInterceptor(),
      ],
    );
  }

  Dio get getInstance => _dio;
}
