import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/homepage/presentation/widgets/value_tile.dart';
import 'package:weather_app/main.dart';

import '../../data/model/weather.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key? key,
    required this.weathers,
  }) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weathers.length,
        separatorBuilder: (context, index) => const Divider(
              height: 100,
              color: Colors.white,
            ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
            label:  DateFormat('E, ha').format(
                  DateTime.fromMillisecondsSinceEpoch(item.time! * 1000)),
             value: '${item.temperature!.as(AppThemeContainer.of(context).temperatureUnit).round()}°',
              iconData: item.getIconData(),
            )),
          );
        },
      ),
    );
  }
}
