import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:find_it/core/locale/locale_controller.dart';
import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/core/theming/my_styles.dart';
import 'package:find_it/features/settings/ui/ChangePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/networking/api_const.dart';
import '../../../core/routing/routes.dart';
import '../../../main.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<String> itemsList = ['en', 'ar'];

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: FancyShimmerImage(
                imageUrl: '${ApiConst.imageFolder}/${savey.getString('profileImage')}',
                width: 70.w,
                height: 70.h,
              ),
            ),
            title: Text(
              '${savey.getString('user_name')}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,Routes.editProfileScreen );
            },
            child: ListTile(
              leading: CircleAvatar(radius: 25.r, backgroundColor: AppColors.myGrayLight, child: SvgPicture.asset('assets/img/profile.svg'),),
              title:  Text(
                "edit_profile".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColors.myGrayLight,
              child: SvgPicture.asset('assets/img/security-safe.svg'),
            ),
            title: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassword()));
              },
              child:  Text(
                "change_pass".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          ListTile(title: Text('regional'.tr,style: MyStyles.font18w500.copyWith(color: Colors.black),)),
          ListTile(
            leading:CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 25.r,
              child: SvgPicture.asset('assets/img/language-circle.svg'),
            ),
            title:  Text(
              "Lan".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            trailing: DropdownButton<String>(
              value: savey.getString('lang'),
              items: itemsList.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {

                });
                  controller.changeLang(value!);

              },
            ),
          ),
          GestureDetector(
            onTap: (){
              savey.clear();
              Get.deleteAll();
              Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
            },
            child: ListTile(
              leading: CircleAvatar( backgroundColor: Colors.black12, radius: 25.r,child: SvgPicture.asset('assets/img/logout.svg'),),
              title:  Text("logout".tr, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16,),
              ),),
          ),

        ],
      ),
    );
  }
}
