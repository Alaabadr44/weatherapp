// search_result_card_item
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../current_city_screen/widgets/temperature_sign_widget.dart';
import '../../current_city_screen/widgets/wind_speed_widget.dart';

class SearchResultCardItem extends StatelessWidget {
  const SearchResultCardItem({
    Key? key,
    required this.cityName,
    required this.iconUrl,
    required this.disc,
    required this.maxTemp,
    required this.minTemp,
    required this.windSpeed,
  }) : super(key: key);

  final String cityName;
  final String iconUrl;
  final String disc;
  final String maxTemp;
  final String minTemp;
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.h,
      width: 185.w,
      decoration: BoxDecoration(
        color: kTextBlack3,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: const [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            blurRadius: 8,
            color: kYellow,
          )
        ],
        border: Border.all(
          color: kYellow,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          // city name
          Center(
            child: Text(
              cityName,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Container(
              height: 61.h,
              width: 68.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(iconUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              disc,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      child:
                          TemperatureSignWidget(degree: minTemp, isMax: false),
                    ),
                  ],
                ),
                WindSpeedWidget(
                  windSpeed: windSpeed,
                ),
                // SizedBox(width: 1.w),
              ],
            ),
          )
        ],
      ),
    );
  }
}
