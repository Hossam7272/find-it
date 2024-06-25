import 'package:find_it/features/auth/login/logic/login_controller.dart';
import 'package:find_it/features/auth/signup/widgets/password_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/myform.dart';

class EmailPasswordForm extends StatelessWidget {
  const EmailPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          MyForm(
            txt: 'username'.tr,
            keyboardType: TextInputType.name,
            controller: controller.usernameController,
            validator: (value){
              if (value == null || value.isEmpty ){
                return 'entermail'.tr;
              }
            },
          ),
        GetBuilder<LoginController>(
            builder: (controller){
              return MyForm(
                suffixIcon: IconButton(
                  onPressed: (){
                    controller.showPass();
                  },
                  icon: controller.isPassHidden ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                ),
                isPassHidden: controller.isPassHidden,
                txt: 'password'.tr,
                keyboardType: TextInputType.name,
                controller: controller.passwordController,
                validator: (value){
                  if (value == null || value.isEmpty ){
                    return 'enterpass'.tr;
                  }
                },
              );
            }
        )

        ],
      ),
    );
  }
}
