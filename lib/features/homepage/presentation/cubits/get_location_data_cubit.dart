import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';

import '../../../../core/data/models/fetch_data_state.dart';
import '../../data/repository/home_repository.dart';

@injectable
class GetLocationDataCubit extends Cubit<FetchDataNoInt<Weather>> {
  GetLocationDataCubit(this._repository)
      : super(const FetchDataNoInt.pending());

  final HomeRepository _repository;

  void fetchLocationData(double lat, double lon) {
    emit(const FetchDataNoInt.pending());
    _repository.getLocationData(lat, lon).then(
          (value) => emit(
            value.fold(
              (value) => FetchDataNoInt.failed(value),
              (value) => FetchDataNoInt.success(value),
            ),
          ),
        );
  }
}
