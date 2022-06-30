import 'package:dio/dio.dart'
    show DioError, DioErrorType, ErrorInterceptorHandler, Interceptor;

import '../../../data/models/errors/exceptions.dart';

class ApiExceptionInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.response) {
      if (err.response?.statusCode == 500) {
        handler.reject(
          DioError(
            requestOptions: err.requestOptions,
            error: ApiException(
              statusCode: 500,
              requestOptions: err.requestOptions,
            ),
          ),
        );
      } else if (err.response != null) {
        handler.next(
          DioError(
            requestOptions: err.requestOptions,
            error: ApiException(
              requestOptions: err.requestOptions,
              statusCode: err.response?.statusCode ?? 600,
              message: ((err.response?.data is Map)
                  ? err.response?.data['detail'] ??
                      err.response?.data['message'] ??
                      err.message
                  : err.message) as String?,
              extras: err.response?.data,
            ),
          ),
        );
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}
