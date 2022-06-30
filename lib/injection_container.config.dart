// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'core/services/network/interceptors/dio_default_exception_retrier.dart'
    as _i7;
import 'core/services/network/interceptors/simple_exception_interceptor.dart'
    as _i8;
import 'core/services/network/network_info.dart' as _i6;
import 'injection_container.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.factory<_i7.DioDefaultExceptionRetrier>(() =>
      _i7.DioDefaultExceptionRetrier(
          connectivity: get<_i3.Connectivity>(),
          networkInfo: get<_i6.NetworkInfo>()));
  gh.factory<_i8.SimpleExceptionRetryInterceptor>(() =>
      _i8.SimpleExceptionRetryInterceptor(
          get<_i7.DioDefaultExceptionRetrier>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
