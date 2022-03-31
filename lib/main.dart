import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service/load_api_key.dart';
import 'presention/app_route.dart';
import 'presention/observer.dart';
import 'presention/pages/splash-screen/splash_screen.dart';
import 'presention/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadApiKeyFromEnvironmentVariables();
//  await WetherRepoImp().fetchCurrentLocationWeatherInfo(lat: 35,long: 139 );
  // WetherRepoImp().fetchCurrentLocationWeatherInfo(lat: "35", long: "139");
  // WetherRepoImp().fetchListCountryWeatherInfo(countries:["tanta","cairo","paris"] );
  // WetherRepoImp()
  //     .fetchCurrentLocationForecastWeatherInfoFor5daysEvery3hours(lat: "35", long: "139");

  BlocOverrides.runZoned(
    () {
      runApp(WeatherApp(appRoute: AppRoute()));
    },
    blocObserver: SimpleBlocObserver(),
  );

  
}

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  late AppRoute appRoute;

  WeatherApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      // splitScreenMode: ,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generateRoute,
        title: 'Material App',
        theme: mainTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
