import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_color.dart';


class HomeButtons extends StatelessWidget {
  String img;
  String txt;
  void Function()? onTap;

  HomeButtons({super.key,required this.img,required this.txt,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(txt,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(height: 10.h,),
        GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            color: AppColors.myGreen,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w , vertical: 13.h),
              child: SvgPicture.asset(img),
            ),
          ),
        ),
      ],
    );
  }
}
