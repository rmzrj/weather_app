import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'dio_default_exception_retrier.dart';

@injectable
class SimpleExceptionRetryInterceptor extends Interceptor {
  final DioDefaultExceptionRetrier _defaultExceptionRetrier;

  SimpleExceptionRetryInterceptor(this._defaultExceptionRetrier);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.shouldHandle) {
      if (err.isSocketException) {
        _defaultExceptionRetrier.retry(err.requestOptions, handler);
      } else if (err.isSimpleHttpException) {
        _defaultExceptionRetrier.retryOrReturnError(err, handler);
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}

extension _ErrExt on DioError {
  /// returns [true] if error is Default Error
  bool get shouldHandle => type == DioErrorType.other;

  /// returns [true] if exception is an SocketException
  bool get isSocketException => error != null && error is SocketException;

  /// returns [true] if exception is an simple HttpException
  bool get isSimpleHttpException {
    final dynamic exp = error;
    if (exp != null && exp is HttpException) {
      if (exp.message.contains('Connection closed while receiving data')) {
        return true;
      }
    }
    return false;
  }
}
