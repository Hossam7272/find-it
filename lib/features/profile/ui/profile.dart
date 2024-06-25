import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/features/card/card_controller.dart';
import 'package:find_it/features/profile/edit_profile/edit_profile.dart';
import 'package:find_it/features/profile/ui/widget/content_profile.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/networking/api_const.dart';
import '../../../core/routing/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    Get.delete<CardController>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myGreen,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xff0BCE83),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.editProfileScreen);
                  },
                  child: Hero(
                    tag: 'profile',
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 70.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: FancyShimmerImage(
                          imageUrl: '${ApiConst.imageFolder}/${savey.getString('profileImage')}',
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 0.53.sh,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70.r),
                      topRight: Radius.circular(70.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "${savey.getString('user_name')}",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${savey.getString('email')}",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        const ContentProfile()

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
