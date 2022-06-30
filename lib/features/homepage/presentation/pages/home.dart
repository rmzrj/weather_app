import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/data/models/fetch_data_state.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_weather_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    log("message");
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<GetWeatherCubit, FetchDataNoInt<Weather>>(
        builder: (context, state) {
         return state.when(
              failed: (failure) => Text(failure.message),
              pending: (pen) => const CircularProgressIndicator(),
              success: (data) => Text(data.cityName!));
    
        },
      ),
    );
  }
}
