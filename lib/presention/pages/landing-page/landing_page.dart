import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/images.dart';
import '../../cubit/weather_cubit.dart';
import '../current_city_screen/current_city_screen.dart';
import '../search-screen/search_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const String routeName = '/LandingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              height: 300.h,
              width: 237.w,
              child: Image.asset(
                imCloud,
                fit: BoxFit.fitWidth,
                height: 300.h,
                width: 237.w,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Weather',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(letterSpacing: 10.w),
          ),
          SizedBox(height: 65.h),
          SizedBox(
            height: 60.h,
            width: 350.w,
            child: BlocBuilder<WeatherCubit, WeatherCubitState>(
              builder: (context, state) {
                WeatherCubit cubit = WeatherCubit.get(context);
                return ElevatedButton(
                  onPressed: () {
                    cubit.onInit();
                    Navigator.of(context)
                        .pushNamed(SearchScreen.routeName)
                        .then((_) => cubit.clearSearchData());
                  },
                  child: Center(
                    child: Text(
                      "Search cities weather",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 35.h),
          Center(
            child: BlocBuilder<WeatherCubit, WeatherCubitState>(
              builder: (context, state) {
                WeatherCubit cubit = WeatherCubit.get(context);
                return TextButton(
                  onPressed: () {
                    cubit.onInit();
                    cubit.getExpectedWeatherDataIn5days();
                    Navigator.of(context)
                        .pushNamed(CityScreen.routeName)
                        .then((value) {
                      cubit.clearCurrentWeatherData();
                    });
                  },
                  child: Text(
                    "Get your city weather",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                );
              },
            ),
          ),
          const Spacer(flex: 5)
        ],
      ),
    );
  }
}
