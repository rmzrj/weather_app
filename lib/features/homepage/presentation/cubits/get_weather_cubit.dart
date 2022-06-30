import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';

import '../../../../core/data/models/fetch_data_state.dart';
import '../../data/repository/home_repository.dart';

@injectable
class GetWeatherCubit extends Cubit<FetchDataNoInt<Weather>> {
  GetWeatherCubit(this._repository) : super(const FetchDataNoInt.pending());

  final HomeRepository _repository;

  void fetchWeatherData(String cityName) {
    print("object1");
    emit(const FetchDataNoInt.pending());
    _repository.getWeatherData(cityName).then(
          (value) => emit(
            value.fold(
              (value) => FetchDataNoInt.failed(value),
              (value) => FetchDataNoInt.success(value),
            ),
          ),
        );
  }
}
