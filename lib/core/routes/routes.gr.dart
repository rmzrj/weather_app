// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/homepage/presentation/pages/home.dart' as _i1;
import '../../features/homepage/presentation/pages/settings_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    SettingsScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SettingsScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Home.name, path: '/'),
        _i3.RouteConfig(SettingsScreen.name, path: '/settings-screen')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i3.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.SettingsScreen]
class SettingsScreen extends _i3.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: '/settings-screen');

  static const String name = 'SettingsScreen';
}
