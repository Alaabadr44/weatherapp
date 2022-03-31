// wind_speed_widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/icons.dart';

class WindSpeedWidget extends StatelessWidget {
  const WindSpeedWidget({
    Key? key,
    required this.windSpeed,
  }) : super(key: key);

  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),
        SvgPicture.asset(
          icoWindSpeed,
          height: 30.h,
          width: 30.w,
          // color: Colors.white,
        ),
        SizedBox(width: 10.w),

        //wind speed
        FittedBox(
          child: Text(
            "S ${windSpeed} m/s",
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Colors.white, fontSize: 10.sp),
          ),
        )
      ],
    );
  }
}
