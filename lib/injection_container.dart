import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/services/network/dio_instance.dart';
import 'injection_container.config.dart';

final getIt = GetIt.instance;



@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @LazySingleton()
  Connectivity get connectivity => Connectivity();

  @LazySingleton()
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @LazySingleton()
  Dio get dio => DioInstance().getInstance;
}
