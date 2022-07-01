import 'package:flutter/material.dart';
import 'package:weather_app/features/homepage/presentation/widgets/value_tile.dart';

import '../../../../core/utils/converters.dart';
import '../../../../main.dart';
import '../../data/model/weather.dart';


// Weather Icon, current, min and max temperatures

class CurrentConditions extends StatelessWidget {
  final Weather weather;
  const CurrentConditions({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = AppThemeContainer.of(context).theme;
    TemperatureUnit unit = AppThemeContainer.of(context).temperatureUnit;

    int currentTemp = weather.temperature!.as(unit).round();
    int maxTemp = weather.maxTemperature!.as(unit).round();
    int minTemp = weather.minTemperature!.as(unit).round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          weather.getIconData(),
          color: Colors.black,
          size: 70,
        ),
       const SizedBox(
          height: 20,
        ),
        Text(
          '$currentTemp°',
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w100,
              color: Colors.black),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ValueTile(label:"max",value: '$maxTemp'),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color: Colors.black.withAlpha(50),
            )),
          ),
          ValueTile(label:"min",value: '$minTemp°'),
        ]),
      ],
    );
  }
}
