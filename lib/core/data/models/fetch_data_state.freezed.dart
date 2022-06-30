// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchDataNoInt<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) pending,
    required TResult Function(T result) success,
    required TResult Function(Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NIPending<T> value) pending,
    required TResult Function(_NISuccess<T> value) success,
    required TResult Function(_NIFailed<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchDataNoIntCopyWith<T, $Res> {
  factory $FetchDataNoIntCopyWith(
          FetchDataNoInt<T> value, $Res Function(FetchDataNoInt<T>) then) =
      _$FetchDataNoIntCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$FetchDataNoIntCopyWithImpl<T, $Res>
    implements $FetchDataNoIntCopyWith<T, $Res> {
  _$FetchDataNoIntCopyWithImpl(this._value, this._then);

  final FetchDataNoInt<T> _value;
  // ignore: unused_field
  final $Res Function(FetchDataNoInt<T>) _then;
}

/// @nodoc
abstract class _$$_NIPendingCopyWith<T, $Res> {
  factory _$$_NIPendingCopyWith(
          _$_NIPending<T> value, $Res Function(_$_NIPending<T>) then) =
      __$$_NIPendingCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_NIPendingCopyWithImpl<T, $Res>
    extends _$FetchDataNoIntCopyWithImpl<T, $Res>
    implements _$$_NIPendingCopyWith<T, $Res> {
  __$$_NIPendingCopyWithImpl(
      _$_NIPending<T> _value, $Res Function(_$_NIPending<T>) _then)
      : super(_value, (v) => _then(v as _$_NIPending<T>));

  @override
  _$_NIPending<T> get _value => super._value as _$_NIPending<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_NIPending<T>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NIPending<T> implements _NIPending<T> {
  const _$_NIPending([this.message = 'Loading...']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'FetchDataNoInt<$T>.pending(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NIPending<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_NIPendingCopyWith<T, _$_NIPending<T>> get copyWith =>
      __$$_NIPendingCopyWithImpl<T, _$_NIPending<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) pending,
    required TResult Function(T result) success,
    required TResult Function(Failure failure) failed,
  }) {
    return pending(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
  }) {
    return pending?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NIPending<T> value) pending,
    required TResult Function(_NISuccess<T> value) success,
    required TResult Function(_NIFailed<T> value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _NIPending<T> implements FetchDataNoInt<T> {
  const factory _NIPending([final String message]) = _$_NIPending<T>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NIPendingCopyWith<T, _$_NIPending<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NISuccessCopyWith<T, $Res> {
  factory _$$_NISuccessCopyWith(
          _$_NISuccess<T> value, $Res Function(_$_NISuccess<T>) then) =
      __$$_NISuccessCopyWithImpl<T, $Res>;
  $Res call({T result});
}

/// @nodoc
class __$$_NISuccessCopyWithImpl<T, $Res>
    extends _$FetchDataNoIntCopyWithImpl<T, $Res>
    implements _$$_NISuccessCopyWith<T, $Res> {
  __$$_NISuccessCopyWithImpl(
      _$_NISuccess<T> _value, $Res Function(_$_NISuccess<T>) _then)
      : super(_value, (v) => _then(v as _$_NISuccess<T>));

  @override
  _$_NISuccess<T> get _value => super._value as _$_NISuccess<T>;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_NISuccess<T>(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_NISuccess<T> implements _NISuccess<T> {
  const _$_NISuccess(this.result);

  @override
  final T result;

  @override
  String toString() {
    return 'FetchDataNoInt<$T>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NISuccess<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_NISuccessCopyWith<T, _$_NISuccess<T>> get copyWith =>
      __$$_NISuccessCopyWithImpl<T, _$_NISuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) pending,
    required TResult Function(T result) success,
    required TResult Function(Failure failure) failed,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NIPending<T> value) pending,
    required TResult Function(_NISuccess<T> value) success,
    required TResult Function(_NIFailed<T> value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _NISuccess<T> implements FetchDataNoInt<T> {
  const factory _NISuccess(final T result) = _$_NISuccess<T>;

  T get result => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NISuccessCopyWith<T, _$_NISuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NIFailedCopyWith<T, $Res> {
  factory _$$_NIFailedCopyWith(
          _$_NIFailed<T> value, $Res Function(_$_NIFailed<T>) then) =
      __$$_NIFailedCopyWithImpl<T, $Res>;
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_NIFailedCopyWithImpl<T, $Res>
    extends _$FetchDataNoIntCopyWithImpl<T, $Res>
    implements _$$_NIFailedCopyWith<T, $Res> {
  __$$_NIFailedCopyWithImpl(
      _$_NIFailed<T> _value, $Res Function(_$_NIFailed<T>) _then)
      : super(_value, (v) => _then(v as _$_NIFailed<T>));

  @override
  _$_NIFailed<T> get _value => super._value as _$_NIFailed<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_NIFailed<T>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_NIFailed<T> implements _NIFailed<T> {
  const _$_NIFailed(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'FetchDataNoInt<$T>.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NIFailed<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_NIFailedCopyWith<T, _$_NIFailed<T>> get copyWith =>
      __$$_NIFailedCopyWithImpl<T, _$_NIFailed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) pending,
    required TResult Function(T result) success,
    required TResult Function(Failure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? pending,
    TResult Function(T result)? success,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NIPending<T> value) pending,
    required TResult Function(_NISuccess<T> value) success,
    required TResult Function(_NIFailed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NIPending<T> value)? pending,
    TResult Function(_NISuccess<T> value)? success,
    TResult Function(_NIFailed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _NIFailed<T> implements FetchDataNoInt<T> {
  const factory _NIFailed(final Failure failure) = _$_NIFailed<T>;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_NIFailedCopyWith<T, _$_NIFailed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
