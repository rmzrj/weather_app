import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String? message;
  final int statusCode;
  final dynamic extras;
  final RequestOptions requestOptions;

  ApiException({
    required this.statusCode,
    required this.requestOptions,
    this.message,
    this.extras,
  });

  @override
  String toString() =>
      "\nCode:$statusCode\nMessage:${message ?? ''}\nRequest\n---${requestOptions.toText()}\n---\n";
}

extension on RequestOptions {
  String toText() {
    return '\nurl:$path\nmethod:$method\ndata:${data.toString()}\nqParm:${queryParameters.toString()}';
  }
}
