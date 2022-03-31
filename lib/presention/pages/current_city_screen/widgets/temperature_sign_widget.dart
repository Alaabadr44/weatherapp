// temperature_sign_widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import 'small_yellow_circle.dart';

class TemperatureSignWidget extends StatelessWidget {
  const TemperatureSignWidget({
    Key? key,
    required this.isMax,
    required this.degree,
  }) : super(key: key);
  final bool isMax;
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          degree,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: isMax ? Colors.white : kTextBlack2,
                fontSize: isMax ? 30.sp : 25.sp,
              ),
        ),
        const Baseline(
          baseline: -5,
          baselineType: TextBaseline.alphabetic,
          child: SmallYellowCircle(),
        )
      ],
    );
  }
}
