import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/service/disign_date.dart';
import '../../../core/service/show_tost.dart';
import '../../../domain/model/weather_model.dart';
import '../../cubit/weather_cubit.dart';
import '../../theme/colors.dart';
import 'widgets/back_ground_image.dart';
import 'widgets/day_button_widget.dart';
import 'widgets/weather_card_item.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);
  static const String routeName = '/CurrentCityScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: BlocConsumer<WeatherCubit, WeatherCubitState>(
          listener: (context, state) {
            if (state is FelidLoadedCurrentLocationWeather) {
              showToast(state.errorMsg, context);
            }
          },
          builder: (context, state) {
            WeatherCubit cubit = WeatherCubit.get(context);
            List<WeatherAppModel?> x = cubit.selectedWeatherInByDay;
            List<String> days = cubit.possibleExpectedDays;
            if (x.isEmpty && days.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: kYellow),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80.h),
                  Center(
                    child: Text(
                      cubit.cityName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 20.h),
                  SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: days.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 4.w);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return DayButtonWidget(
                            day: designDey(days[index]),
                            isSelected: days[index] == cubit.selectedDey,
                            onPressed: () => cubit.choseForecastWeatherInfoIn(
                              days[index],
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 10.h),
                  SizedBox(
                      height: 720.h,
                      width: double.infinity,
                      child: GridView.count(
                          shrinkWrap: true,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 10.h,
                          crossAxisCount: 2,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: x
                              .map(
                                (e) => WeatherCardItem(
                                  windSpeed: e!.windSpeed.toString(),
                                  maxTemp: e.max!.toInt().toString(),
                                  minTemp: e.min!.toInt().toString(),
                                  iconUrl: e.icon,
                                  disc: e.description!,
                                  hour: designHour(
                                    e.data!,
                                  ),
                                ),
                              )
                              .toList())),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
