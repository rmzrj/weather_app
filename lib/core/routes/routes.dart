import 'package:auto_route/annotations.dart';
import 'package:weather_app/features/homepage/presentation/pages/home.dart';
import 'package:weather_app/features/homepage/presentation/pages/settings_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute<dynamic>(page: Home,initial: true ),
    AutoRoute<dynamic>(page: SettingsScreen, ),
  ]
   
)
class $AppRouter {}
