import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.network({
    required String message,
    @Default('NetworkFailure') String title,
  }) = _NetworkFailure;

  const factory Failure.unhandled({
    required String message,
    @Default('ServerFailure') String title,
  }) = _UnhandledFailure;

  const factory Failure.connectionTimeout({
    required String message,
    @Default('ConnectionTimeOutFailure') String title,
  }) = _ConnectionTimeOutFailure;

  const factory Failure.api({
    required String message,
    @Default('ApiFailure') String title,
    @Default(500) int statusCode,
    dynamic extras,
  }) = _ApiFailure;

  const factory Failure.cognito({
    required String message,
    @Default('CognitoAuthFailure') String title,
    @Default(false) bool shouldResendCode,
    String? code,
  }) = _CognitoAuthFailure;

  const factory Failure.cache({
    required String message,
    @Default('CacheFailure') String title,
  }) = _CacheFailure;

  const factory Failure.fileLoad({
    required String message,
    @Default('FileLoadFailure') String title,
    String? fileName,
  }) = _FileLoadFailure;

  const factory Failure.payment({
    required String message,
    @Default('PaymentFailure') String title,
    String? paymentInfo,
  }) = _PaymentFailure;
}
