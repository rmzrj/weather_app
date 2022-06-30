import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/data/constants.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';

abstract class RemoteDataSource {
  Future<Weather> getWeatherData(String cityName);
  Future<List<Weather>> getForecast(String cityName);
  Future<Weather> getLocationData(double lat, double lon);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio _dio;
  RemoteDataSourceImpl(this._dio);

  @override
  Future<List<Weather>> getForecast(String cityName) async {
    final path = baseUrl + '/forecastByLocation/$cityName';
    final res = await _dio.get(path);
    List<Weather> result = Weather.fromForecastJson(res.data);
    return result;
  }

  @override
  Future<Weather> getWeatherData(String cityName) async {
    print("object");
    final path = baseUrl + '/weatherByCity/$cityName';
    final res = await _dio.get(path);
    log(res.data.toString());
    return Weather.fromJson(res.data);
  }

  @override
  Future<Weather> getLocationData(double lat, double lon) async {
    final path = baseUrl + '/locationData/$lat,$lon';
    final res = await _dio.get(path);
    return Weather.fromJson(res.data);
  }
}
