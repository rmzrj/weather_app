import 'package:freezed_annotation/freezed_annotation.dart';

import 'errors/failures.dart';

part 'fetch_data_state.freezed.dart';

@freezed
class FetchDataNoInt<T> with _$FetchDataNoInt<T> {
  const factory FetchDataNoInt.pending([
    @Default('Loading...') String message,
  ]) = _NIPending;
  const factory FetchDataNoInt.success(T result) = _NISuccess;
  const factory FetchDataNoInt.failed(Failure failure) = _NIFailed;
}
