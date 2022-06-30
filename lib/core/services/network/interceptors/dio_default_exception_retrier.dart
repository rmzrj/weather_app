import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/network_utils.dart';
import '../network_info.dart';

@injectable
class DioDefaultExceptionRetrier {
  final Connectivity connectivity;
  final NetworkInfo networkInfo;
  final Dio _dio;

  DioDefaultExceptionRetrier({
    required this.connectivity,
    required this.networkInfo,
  }) : _dio = Dio();

  void retryOrReturnError(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) {
    networkInfo.isConnected.then(
      (isConnected) {
        if (isConnected) {
          retry(dioError.requestOptions, handler);
        } else {
          handler.next(dioError);
        }
      },
    );
  }

  void retry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) {
    late final StreamSubscription _conChangeStream;
    _conChangeStream = connectivity.onConnectivityChanged.listen(
      (conResult) {
        if (conResult != ConnectivityResult.none) {
          _conChangeStream.cancel();
          requestOptions
              .toDioResponse(_dio)
              .then((response) => handler.resolve(response));
        }
      },
    );
  }
}
