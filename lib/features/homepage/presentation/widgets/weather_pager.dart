import 'package:flutter/material.dart';
import 'package:weather_app/features/homepage/presentation/widgets/current_conditions.dart';


import '../../../../main.dart';
import '../../data/model/weather.dart';

class WeatherPager extends StatelessWidget {
  const WeatherPager({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = AppThemeContainer.of(context).theme;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: CurrentConditions(
              weather: weather,
            )
      
      
      
      // Swiper(
      //   itemCount: 2,
      //   index: 0,
      //   itemBuilder: (context, index) {
      //     if (index == 0) {
      //       return CurrentConditions(
      //         weather: weather,
      //       );
      //     } else if (index == 1) {
      //       return TemperatureLineChart(
      //        weathers: weather.forecast!,
      //         animate: true,
      //       );
      //     }
      //     return const SizedBox();
      //   },
      //   pagination:  SwiperPagination(
      //     margin: const EdgeInsets.all(5.0),
      //     builder:  DotSwiperPaginationBuilder(
      //         size: 5,
      //         activeSize: 5,
      //         color: AppThemeContainer.of(context)
      //             .theme
      //             .colorScheme.secondary
      //             .withOpacity(0.4),
      //         activeColor: appTheme.colorScheme.secondary),
      //   ),
      // ),



    );
  }
}
