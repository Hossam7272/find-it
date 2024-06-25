import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_color.dart';
import '../theming/my_styles.dart';

class HomeTitleAppBar extends StatelessWidget {
  String userName;
  HomeTitleAppBar({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w),
        alignment: Alignment.center,
        width: 100.w,
        height: 25.h,
        decoration: BoxDecoration(
            color: AppColors.GrayDA,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(userName,style: MyStyles.font18w500.copyWith(color: Colors.black),)
    );
  }
}
