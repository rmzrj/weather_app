import 'package:auto_route/annotations.dart';
import 'package:weather_app/features/homepage/presentation/pages/home.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute<dynamic>(page: Home, initial: true),
  ]
   
)
class $AppRouter {}
