import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

var mainTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 50.sp,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      color: kGrey,
    ),
    bodyText1: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: kGrey,
      ),
    headline2: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    bodyText2: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        color: kTextBlack,
      ),
    headline6: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        // fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
      headline3: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      // fontStyle: FontStyle.italic,
      color: kGrey,
    ), 
  ),
);
