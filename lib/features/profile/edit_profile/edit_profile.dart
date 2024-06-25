import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:find_it/core/widgets/mybtn.dart';
import 'package:find_it/features/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../core/networking/api_const.dart';
import '../../../core/theming/my_styles.dart';
import '../../../main.dart';
import '../ui/widget/text_fields_edit_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: const Color(0xffF6F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'profile',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.r),
                  child: Expanded(
                      child: FancyShimmerImage(
                        imageUrl: '${ApiConst.imageFolder}/${savey.getString('profileImage')}',
                        width: 200.w,
                        height: 200.h,
                      )
                  ),
                ),
              ),
              TextButton(
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
                              onTap: () {
                                controller.galleryOneImagePicker();
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
                                controller.cameraImagePicker();
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

                  }, child: const Text('Change photo' , style: TextStyle(color: Colors.green),)),
              const TextFiledsEditProfile(),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MyBtn(
                    onTap: (){
                      controller.editProfile();
                    },
                    myChild: Text('Save Changes',style: MyStyles.font18w500,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
