import 'package:find_it/core/theming/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_color.dart';

class MyBtn extends StatelessWidget {
  void Function() onTap;
  Widget myChild;
  bool inside;
  MyBtn({super.key,required this.onTap,required this.myChild,this.inside = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          width: inside ? 187.w : 306.w,
          height: 50.h,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(100),
            color: AppColors.myGreen,
            child: Center(child: myChild),

          ),
        ),
      ),
    );
  }
}
