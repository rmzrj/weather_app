import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/constants.dart';
import 'core/routes/routes.gr.dart';
import 'core/utils/converters.dart';
import 'core/utils/themes.dart';
import 'features/homepage/presentation/cubits/get_forcast_cubit.dart';
import 'features/homepage/presentation/cubits/get_location_data_cubit.dart';
import 'features/homepage/presentation/cubits/get_weather_cubit.dart';
import 'injection_container.dart';

final EasyLogger logger = EasyLogger(
  name: 'WeatherApp',
);

void main() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(AppThemeContainer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetWeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetLocationDataCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetForecastCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: 'WeatherApp',
      ),
    );
  }
}

class AppThemeContainer extends StatefulWidget {
  final Widget child;

 const AppThemeContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _AppThemeContainerState createState() => _AppThemeContainerState();

  static _AppThemeContainerState of(BuildContext context) {
    var widget =
        context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>();
    return widget!.data;
  }
}

class _AppThemeContainerState extends State<AppThemeContainer> {
  ThemeData _theme = Themes.getTheme(Themes.DARK_THEME_CODE);
  int themeCode = Themes.DARK_THEME_CODE;
  TemperatureUnit temperatureUnit = TemperatureUnit.celsius;

  @override
  initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPref) {
      setState(() {
        themeCode = sharedPref.getInt(PREF_KEY_THEME) ??
            Themes.DARK_THEME_CODE;
        temperatureUnit = TemperatureUnit.values[
            sharedPref.getInt(PREF_KEY_TEMPERATURE_UNIT) ??
                TemperatureUnit.celsius.index];
        _theme = Themes.getTheme(themeCode);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

  ThemeData get theme => _theme;

  updateTheme(int themeCode) {
    setState(() {
      _theme = Themes.getTheme(themeCode);
      this.themeCode = themeCode;
    });
    SharedPreferences.getInstance().then((sharedPref) {
      sharedPref.setInt(PREF_KEY_THEME, themeCode);
    });
  }

  updateTemperatureUnit(TemperatureUnit unit) {
    setState(() {
      temperatureUnit = unit;
    });
    SharedPreferences.getInstance().then((sharedPref) {
      sharedPref.setInt(PREF_KEY_TEMPERATURE_UNIT, unit.index);
    });
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppThemeContainerState data;

  const _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer oldWidget) => true;
}
