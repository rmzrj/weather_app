import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../data/model/weather.dart';


class TemperatureLineChart extends StatelessWidget {
  final List<Weather> weathers;
  final bool? animate;

 const TemperatureLineChart(
   { Key? key,
   required this.weathers,
    this.animate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: charts.TimeSeriesChart(
        [
           charts.Series<Weather, DateTime>(
            id: 'Temperature',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (Weather weather, _) =>
                DateTime.fromMillisecondsSinceEpoch(weather.time! * 1000),
            measureFn: (Weather weather, _) => weather.temperature!
                .as(AppThemeContainer.of(context).temperatureUnit),
            data: weathers,
          )
        ],
        animate: animate,
        animationDuration: const Duration(milliseconds: 500),
        primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec:  charts.BasicNumericTickProviderSpec(
            zeroBound: false,
          ),
        ),
      ),
    );
  }
}
