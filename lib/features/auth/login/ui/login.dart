import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/core/theming/my_styles.dart';
import 'package:find_it/features/auth/login/logic/login_controller.dart';
import 'package:find_it/features/auth/login/ui/widgets/email_password_form.dart';
import 'package:find_it/features/auth/signup/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/mybtn.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.myWhiteLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150.h,),
              SvgPicture.asset('assets/img/unlimited.svg',color: AppColors.myGreen,),
              const EmailPasswordForm(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Don\'t have account? ',style: MyStyles.heebofont16w500),
                    TextSpan(
                      text: 'create new account',
                      style: MyStyles.heebofont16w500.copyWith(color: AppColors.myGreen),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                      },
                    )
                  ]
                ),
              ),
              SizedBox(height: 100.h,),
              GetBuilder<LoginController>(
                  builder: (controller){
                    return MyBtn(onTap: (){
                      controller.login();
                    }, myChild: controller.isLoaded ? const CircularProgressIndicator(color: Colors.green,) :Text('login'.tr,style: MyStyles.font18w500,));
                  }
              ),
              TextButton(onPressed:  (){
              }, child: Text('forget'.tr,style: MyStyles.heebofont16w500,))
            ],
          ),
        ),
      ),

    );
  }
}
