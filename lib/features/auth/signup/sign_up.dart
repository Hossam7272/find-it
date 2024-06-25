import 'package:find_it/features/auth/login/ui/login.dart';
import 'package:find_it/features/auth/signup/logic/signup_controller.dart';
import 'package:find_it/features/auth/signup/widgets/data_forms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/my_styles.dart';
import '../../../core/widgets/mybtn.dart';
import 'logic/image_picker.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 90.h,),
                    ListTile(
                      title: Text(
                          'Create a new account',
                          style: MyStyles.heebofont20w500black
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.person , color: Colors.green,),
                        onPressed: (){
                          Get.defaultDialog(
                            title: "Set Your Profile Picture",
                            middleText: '',
                            actions: [
                              Material(
                                color: const Color(0xffE7FAF4),
                                borderRadius: BorderRadius.circular(45.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(45.r),
                                  onTap: () async{
                                    await MyImagePicker().galleryOneImagePicker();
                                    await controller.extractText(MyImagePicker.image);
                                    print('object');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.camera_alt_rounded,
                                          color: Color(0xff12D18E),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          "Choose from Gallery",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xff12D18E),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: const Color(0xffE7FAF4),
                                borderRadius: BorderRadius.circular(45.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(45.r),
                                  onTap: () {
                                    MyImagePicker().cameraImagePicker();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.camera_alt_rounded,
                                          color: Color(0xff12D18E),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          "Open Camera & Take Photo",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xff12D18E),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ]
                          );
                        },
                      ),
                    ),
                    const DataForms(),
                    Text(
                      'By Clicking Sign Up, you agree to our Terms, Data Policy and Cookies Policy. You may receive SMS Notifications from us and can opt out any time.',
                      style: MyStyles.heebofont12w500black
                    ),
                    SizedBox(height: 25.h,),
                    Center(
                      child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: 'You already have account? ',style: MyStyles.heebofont16w500),
                              TextSpan(
                                text: 'Log in',
                                style: MyStyles.heebofont16w500.copyWith(color: AppColors.myGreen),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                                },
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    MyBtn(onTap: (){
                      controller.signUp(context);
                    }, myChild: Text('SignUp',style: MyStyles.font18w500,))
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}
