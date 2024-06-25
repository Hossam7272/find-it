import 'package:find_it/core/widgets/mybtn.dart';
import 'package:find_it/features/upload/screens/upload_ai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/my_styles.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyBtn(onTap: (){
                Get.toNamed(Routes.uploadItemsScreen);
              }, myChild: Text('Upload Items'.tr,style: MyStyles.font18w500,)),
              MyBtn(onTap: (){
                Get.toNamed(Routes.uploadChildrenScreen);
              }, myChild: Text('Upload_child'.tr,style: MyStyles.font18w500,)),
            ],
          ),
        ],
      ),
    );
  }
}
