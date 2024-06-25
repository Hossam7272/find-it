import 'package:find_it/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyles{
  static TextStyle headStyle = TextStyle(fontSize: 40.sp,fontWeight: FontWeight.bold,color: Colors.black);
  static TextStyle mainStyle = TextStyle(fontSize: 20.sp,color: Colors.white);
  static TextStyle font24w400 = TextStyle(fontSize: 24.sp,color: Colors.white,fontWeight: FontWeight.w400);
  static TextStyle font16w400 = TextStyle(fontSize: 16.sp,color: AppColors.myGrayThin,fontWeight: FontWeight.w400);
  static TextStyle font18w500 = TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w500);
  static TextStyle font28w700 = TextStyle(fontSize: 28.sp,color: Colors.black,fontWeight: FontWeight.w700);
  static TextStyle font24w700 = TextStyle(fontSize: 24.sp,color: Colors.black,fontWeight: FontWeight.w700);

  static TextStyle heebofont16w500 = GoogleFonts.heebo(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w500);
  static TextStyle heebofont20w500black = GoogleFonts.heebo(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.w500);
  static TextStyle heebofont12w500black = GoogleFonts.heebo(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w500);
  static TextStyle heebofont24w500black = GoogleFonts.heebo(fontSize: 24.sp,color: Colors.black,fontWeight: FontWeight.w500);

}