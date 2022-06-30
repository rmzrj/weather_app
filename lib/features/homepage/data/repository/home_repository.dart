import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/utils/repo_utils.dart';
import 'package:weather_app/features/homepage/data/data_source/remote_data_source.dart';

import '../../../../core/data/models/errors/failures.dart';
import '../model/weather.dart';

abstract class HomeRepository {
  Future<Either<Failure, Weather>> getWeatherData(String cityName);
  Future<Either<Failure, List<Weather>>> getForecast(String cityName);
  Future<Either<Failure, Weather>> getLocationData(double lat, double lon);
}

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Weather>>> getForecast(String cityName) {
    return repoExecute(() => remoteDataSource.getForecast(cityName));
  }

  @override
  Future<Either<Failure, Weather>> getLocationData(double lat, double lon) {
    return repoExecute(() => remoteDataSource.getLocationData(lat, lon));
  }

  @override
  Future<Either<Failure, Weather>> getWeatherData(String cityName) {
   
    return repoExecute(() => remoteDataSource.getWeatherData(cityName));
  }
}
