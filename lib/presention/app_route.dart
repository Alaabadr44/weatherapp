import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/wether_repo_imp.dart';
import 'cubit/weather_cubit.dart';
import 'pages/current_city_screen/current_city_screen.dart';
import 'pages/landing-page/landing_page.dart';
import 'pages/search-screen/search_screen.dart';
import 'pages/splash-screen/splash_screen.dart';

class AppRoute {
  late WetherRepoImp repo;
  late WeatherCubit cubit;
  AppRoute() {
    repo = WetherRepoImp();
    cubit = WeatherCubit(repo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case LandingPage.routeName:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider<WeatherCubit>(
            create:(_)=> cubit,
            child: const LandingPage(),
          ),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider<WeatherCubit>.value(
            value: cubit,
            child: const SearchScreen(),
          ),
        );
      case CityScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider<WeatherCubit>.value(
            value:  cubit..getExpectedWeatherDataIn5days(),
            child: const CityScreen(),
          ),
        );
    }
    return null;
  }
}
