import 'package:find_it/core/theming/my_styles.dart';
import 'package:find_it/core/widgets/mybtn.dart';
import 'package:find_it/core/widgets/myform.dart';
import 'package:find_it/features/settings/logic/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theming/app_color.dart';
import '../../auth/signup/widgets/password_validation.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColors.myWhiteLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 17.w , right: 17.w , top: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('strong password required enter 8-16 characters don\’t include common words or name uppercase letters lowercase  letters, number,and symbols ',style: MyStyles.heebofont16w500),
                  SizedBox(height: 30.h,),
                  MyForm(txt: 'new password',validator: (value){return passwordValidation(value!);},controller: controller.newPasswordController,),
                  SizedBox(height: 15.h,),
                  MyForm(txt: 'confirm new password',validator: (value){return passwordValidation(value!);},controller: controller.repeatPasswordController,),
                ],
              ),
              MyBtn(onTap: (){
                controller.changePassword();
              }, myChild: Text('Confirm',style: MyStyles.font18w500,))
            ],

          ),

        ),


      ),


    );
  }
}
