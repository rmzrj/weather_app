import 'package:dio/dio.dart';

const Map<String, String> commonHeaders = {'Content-Type': 'application/json'};

/// give response.data parameter [data]
List<dynamic>? getRawObjects(dynamic data) =>
    data == null ? <dynamic>[] : data['data']['objects'] as List<dynamic>;

/// give response.data parameter [data]
dynamic getRawObject(dynamic data) => data['data']['object'];

/// give response.data parameter [data]
String? getPagination(dynamic data) =>
    data['data']['pagination']['next'] as String?;

String? getNewPagination(dynamic data) => data['pagination']['next'] as String?;

extension DioRequestUtils on RequestOptions {
  Options get toOptions => Options(
        contentType: contentType,
        extra: extra,
        followRedirects: followRedirects,
        headers: headers,
        listFormat: listFormat,
        maxRedirects: maxRedirects,
        method: method,
        receiveDataWhenStatusError: receiveDataWhenStatusError,
        receiveTimeout: receiveTimeout,
        requestEncoder: requestEncoder,
        responseDecoder: responseDecoder,
        responseType: responseType,
        sendTimeout: sendTimeout,
        validateStatus: validateStatus,
      );

  Future<Response> toDioResponse(Dio dio) => dio.request<dynamic>(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        options: toOptions,
      );
}
