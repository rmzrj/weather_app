import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';

import '../../../../core/data/models/fetch_data_state.dart';
import '../../data/repository/home_repository.dart';

@injectable
class GetForecastCubit extends Cubit<FetchDataNoInt<List<Weather>>> {
  GetForecastCubit(this._repository)
      : super(const FetchDataNoInt.pending());

  final HomeRepository _repository;

  void fetchForecastData(String cityName) {
    emit(const FetchDataNoInt.pending());
    _repository.getForecast(cityName).then(
          (value) => emit(
            value.fold(
              (value) => FetchDataNoInt.failed(value),
              (value) => FetchDataNoInt.success(value),
            ),
          ),
        );
  }
}
