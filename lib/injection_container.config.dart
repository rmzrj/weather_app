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
    as _i8;
import 'core/services/network/interceptors/simple_exception_interceptor.dart'
    as _i10;
import 'core/services/network/network_info.dart' as _i6;
import 'features/homepage/data/data_source/remote_data_source.dart' as _i7;
import 'features/homepage/data/repository/home_repository.dart' as _i9;
import 'features/homepage/presentation/cubits/get_forcast_cubit.dart' as _i11;
import 'features/homepage/presentation/cubits/get_location_data_cubit.dart'
    as _i12;
import 'features/homepage/presentation/cubits/get_weather_cubit.dart' as _i13;
import 'injection_container.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.RemoteDataSource>(
      () => _i7.RemoteDataSourceImpl(get<_i4.Dio>()));
  gh.factory<_i8.DioDefaultExceptionRetrier>(() =>
      _i8.DioDefaultExceptionRetrier(
          connectivity: get<_i3.Connectivity>(),
          networkInfo: get<_i6.NetworkInfo>()));
  gh.lazySingleton<_i9.HomeRepository>(
      () => _i9.HomeRepositoryImpl(get<_i7.RemoteDataSource>()));
  gh.factory<_i10.SimpleExceptionRetryInterceptor>(() =>
      _i10.SimpleExceptionRetryInterceptor(
          get<_i8.DioDefaultExceptionRetrier>()));
  gh.factory<_i11.GetForecastCubit>(
      () => _i11.GetForecastCubit(get<_i9.HomeRepository>()));
  gh.factory<_i12.GetLocationDataCubit>(
      () => _i12.GetLocationDataCubit(get<_i9.HomeRepository>()));
  gh.factory<_i13.GetWeatherCubit>(
      () => _i13.GetWeatherCubit(get<_i9.HomeRepository>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
