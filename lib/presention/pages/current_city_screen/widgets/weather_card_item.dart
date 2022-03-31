// weather_card_item
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import 'temperature_sign_widget.dart';
import 'wind_speed_widget.dart';

class WeatherCardItem extends StatelessWidget {
  const WeatherCardItem({
    Key? key,
    required this.windSpeed,
    required this.maxTemp,
    required this.minTemp,
    this.iconUrl,
    required this.hour,
    required this.disc,
  }) : super(key: key);

  final String windSpeed;
  final String maxTemp;
  final String minTemp;
  final String? iconUrl;
  final String hour;
  final String disc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: const Color(0xff1F1F21),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Center(
              child: Text(
            hour,
            style: TextStyle(color: kYellow, fontSize: 15.sp),
          )),
          SizedBox(height: 10.h),
          WindSpeedWidget(windSpeed: windSpeed),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  iconUrl ?? "https://openweathermap.org/img/wn/10d@2x.png",
                ),
                fit: BoxFit.fitHeight,
              )),
            ),
          ),
          Center(
              child: Text(
            disc,
            style: const TextStyle(color: Colors.white),
          )),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Baseline(
                baseline: 10,
                baselineType: TextBaseline.alphabetic,
                child:
                    //maX
                    TemperatureSignWidget(degree: maxTemp, isMax: true),
              ),

              //min
              Baseline(
                baseline: 16,
                baselineType: TextBaseline.alphabetic,
                child: TemperatureSignWidget(degree: minTemp, isMax: false),
              ),
            ],
          )
        ],
      ),
    );
  }
}
