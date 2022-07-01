import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/homepage/presentation/widgets/value_tile.dart';
import 'package:weather_app/features/homepage/presentation/widgets/weather_pager.dart';

import '../../data/model/weather.dart';
import 'forecast_horizontal_widget.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  final List<Weather> forecast;

  const WeatherWidget({
    Key? key,
    required this.weather,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WeatherPager(weather: weather),
          Text(
            weather.description!.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              letterSpacing: 5,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Text(
                weather.cityName!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  letterSpacing: 5,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
            style: TextStyle(
                color: Colors.black.withAlpha(80),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Padding(
            child: Divider(
              color: Colors.black.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          ForecastHorizontal(weathers: forecast),
          Padding(
            child: Divider(
              color: Colors.black.withAlpha(50),
            ),
            padding: const EdgeInsets.all(10),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 18.0, bottom: 18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.grey.withAlpha(70))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ValueTile(
                          label: "wind speed",
                          value: '${weather.windSpeed} m/s'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                            child: Container(
                          width: 1,
                          height: 30,
                          color: Colors.black.withAlpha(50),
                        )),
                      ),
                      ValueTile(
                          label: "sunrise",
                          value: DateFormat('h:m a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  weather.sunrise! * 1000))),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                            child: Container(
                          width: 1,
                          height: 30,
                          color: Colors.black.withAlpha(50),
                        )),
                      ),
                      ValueTile(
                          label: "sunset",
                          value: DateFormat('h:m a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  weather.sunset! * 1000))),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                            child: Container(
                          width: 1,
                          height: 30,
                          color: Colors.black.withAlpha(50),
                        )),
                      ),
                      ValueTile(
                          label: "humidity", value: '${weather.humidity}%'),
                    ]),
              ),
            ),
          ),
         const SizedBox(height: 80,)
        ],
      ),
    );
  }
}
