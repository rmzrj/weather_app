import 'package:flutter/material.dart';
import 'package:weather_app/features/homepage/presentation/widgets/current_conditions.dart';

import '../../data/model/weather.dart';

class WeatherPager extends StatelessWidget {
  const WeatherPager({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: CurrentConditions(
          weather: weather,
        ));
  }
}
