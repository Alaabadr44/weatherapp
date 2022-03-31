// day_button_widget
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class DayButtonWidget extends StatelessWidget {
  const DayButtonWidget({
    Key? key,
    required this.day,
    this.onPressed,
    required this.isSelected,
  }) : super(key: key);
  final bool isSelected;

  final String day;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        day,
        style: Theme.of(context).textTheme.headline2?.copyWith(
              color: isSelected ? kYellow : kTextBlack2,
              // color: kTextBlack2,
            ),
      ),
    );
  }
}
