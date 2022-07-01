import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/homepage/presentation/widgets/value_tile.dart';
import 'package:weather_app/features/homepage/presentation/widgets/weather_pager.dart';

import '../../data/model/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            weather.cityName!.toUpperCase(),
            style: const TextStyle(
              fontSize: 25,
              letterSpacing: 5,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
         const SizedBox(height: 20),
          Text(
            weather.description!.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              letterSpacing: 5,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            ),
          ),
          WeatherPager(weather: weather),
          Padding(
            child: Divider(
              color: Colors.black.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          // ForecastHorizontal(weathers: weather.forecast),
          Padding(
            child: Divider(
              color: Colors.black.withAlpha(50),
            ),
            padding: const EdgeInsets.all(10),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ValueTile(label:"wind speed", value:'${weather.windSpeed} m/s'),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color:Colors.black
                    .withAlpha(50),
              )),
            ),
            ValueTile(
               label: "sunrise",
              value: DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    weather.sunrise! * 1000))),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: Colors.black
                    .withAlpha(50),
              )),
            ),
            ValueTile(
               label: "sunset",
               value: DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    weather.sunset! * 1000))),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: Colors.black
                    .withAlpha(50),
              )),
            ),
            ValueTile( label: "humidity", value: '${weather.humidity}%'),
          ]),
        ],
      ),
    );
  }
}
