import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/my_styles.dart';

class HomeSearch extends StatelessWidget {
  bool type;
  HomeSearch({super.key,this.type = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(type){
          Get.toNamed(Routes.searchChildScreen);
        }else{
          Get.toNamed(Routes.searchItemScreen);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: AppColors.GreenDC,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: AppColors.myMove,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text('search'.tr,
                style: MyStyles.font16w400
                    .copyWith(color: AppColors.myMove)),

          ],
        ),
      ),
    );
  }
}
