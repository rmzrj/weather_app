import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/data/models/fetch_data_state.dart';
import 'package:weather_app/features/homepage/data/model/weather.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_forcast_cubit.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_location_data_cubit.dart';
import 'package:weather_app/features/homepage/presentation/cubits/get_weather_cubit.dart';
import 'package:weather_app/features/homepage/presentation/widgets/weather_widget.dart';

import '../../../../core/routes/routes.gr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double>? _fadeAnimation;
  AnimationController? _fadeController;
  String _cityName = 'Manama';

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
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.my_location),
            onPressed: () => getWeatherWithLocation(),
          ),
        ),
        backgroundColor: Colors.white,
        body: Material(
            child: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(color: Colors.white),
            child: FadeTransition(
              opacity: _fadeAnimation!,
              child:
                  BlocListener<GetLocationDataCubit, FetchDataNoInt<Weather>>(
                listener: (context, state) {
                  state.maybeWhen(orElse: () {
                    showDialog<void>(
                      barrierColor: Colors.white.withOpacity(0.5),
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }, success: (res) {
                    Navigator.pop(context);
                    context
                        .read<GetWeatherCubit>()
                        .fetchWeatherData(res.cityName!);
                    context
                        .read<GetForecastCubit>()
                        .fetchForecastData(res.cityName!);    
                  });
                },
                child: BlocBuilder<GetWeatherCubit, FetchDataNoInt<Weather>>(
                    buildWhen: (previous, current) => current.when(
                        pending: (pen) => false,
                        success: (res) => true,
                        failed: (fail) => true),
                    builder: (context, state) {
                      _fadeController!.reset();
                      _fadeController!.forward();
                      return state.when(
                          pending: (pen) => const SizedBox(),
                          success: (data) {
                            _cityName = data.cityName!;
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  offset: Offset(0, 1),
                                                  blurRadius: 2,
                                                  color: Colors.grey)
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  onSubmitted: (value) =>
                                                      context
                                                          .read<
                                                              GetWeatherCubit>()
                                                          .fetchWeatherData(
                                                              value),
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              "Search city here",
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          border:
                                                              InputBorder.none),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(const SettingsScreen());
                                          },
                                          icon: const Icon(Icons.settings))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                BlocBuilder<GetForecastCubit,
                                    FetchDataNoInt<List<Weather>>>(
                                  buildWhen: (previous, current) =>
                                      current.when(
                                          pending: (pen) => false,
                                          success: (res) => true,
                                          failed: (fail) => false),
                                  builder: (context, state) {
                                   return state.maybeWhen(
                                      orElse: ()=> const SizedBox(),
                                        success: (forecast) =>
                                            WeatherWidget(weather: data,forecast: forecast,));
                                  },
                                ),
                              ],
                            );
                          },
                          failed: (fail) {
                            getWeatherWithLocation();
                            return Center(child: Text(fail.message));
                          });
                    }),
              ),
            ),
          ),
        )));
  }

  Future<void> getWeatherWithLocation() async {
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
            timeLimit: const Duration(seconds: 4));

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
        context.read<GetForecastCubit>().fetchForecastData(_cityName);

  }
}
