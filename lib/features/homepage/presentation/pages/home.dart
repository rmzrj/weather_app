import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/data/models/fetch_data_state.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_location_data_cubit.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_weather_cubit.dart';
import 'package:weather_app/features/homepage/presentation/widgets/weather_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double>? _fadeAnimation;
  AnimationController? _fadeController;
  String _cityName = 'Chemmad';

  @override
  void initState() {
    super.initState();

    getWeatherWithLocation().catchError((err) {
      getWeatherData();
    });
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController!,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Material(
            child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(color: Colors.white),
          child: FadeTransition(
            opacity: _fadeAnimation!,
            child: BlocBuilder<GetWeatherCubit, FetchDataNoInt<Weather>>(
                builder: (context, state) {
                  _fadeController!.reset();
                _fadeController!.forward();
             return state.when(
                  pending: (pen) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  success: (data) {
                    _cityName = data.cityName!;
                    return WeatherWidget(weather: data);
                  },
                  failed: (fail) {
                    return Text(fail.message);
                  });
            }),
          ),
        )));
  }

  getWeatherWithLocation() async {
    var permission = await Permission.locationWhenInUse.status;
    switch (permission) {
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        showLocationDeniedDialog();
        break;
      case PermissionStatus.denied:
        await Permission.locationWhenInUse.request();
        getWeatherWithLocation();
        break;

      case PermissionStatus.limited:
      case PermissionStatus.granted:
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
            timeLimit: const Duration(seconds: 2));

        context
            .read<GetLocationDataCubit>()
            .fetchLocationData(position.latitude, position.longitude);
        break;
    }
  }

  void showLocationDeniedDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // ThemeData appTheme = AppStateContainer.of(context).theme;

          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Location is disabled :(',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                child: const Text('Enable!'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  elevation: 1,
                ),
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  getWeatherData() {
    context.read<GetWeatherCubit>().fetchWeatherData(_cityName);
  }
}
