import 'package:find_it/core/theming/my_styles.dart';
import 'package:find_it/features/upload/logic/upload_items_controller.dart';
import 'package:find_it/features/upload/widgets/button_upload.dart';
import 'package:find_it/features/upload/widgets/upload_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theming/app_color.dart';
import '../widgets/upload_image.dart';

class UploadItemsScreen extends StatefulWidget {
  const UploadItemsScreen({super.key});

  @override
  State<UploadItemsScreen> createState() => _UploadItemsScreenState();
}

class _UploadItemsScreenState extends State<UploadItemsScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.delete<UploadItemController>();
  }
  @override
  Widget build(BuildContext context) {
    UploadItemController controller = Get.put(UploadItemController());
    DateTime date = DateTime.now();
    return Scaffold(
        backgroundColor: AppColors.myWhiteLight,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.myWhiteLight,
          title: Text("Upload Item",
              style: MyStyles.font28w700.copyWith(color: Colors.black)),
        ),
        body: Form(
          key: controller.gk,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const UploadImage(),
                  UploadForms(
                      nameController: controller.name,
                      locationController: controller.location,
                      dateFunction: () async {
                        controller.newDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(200),
                            lastDate: date);
                      }),
                  ButtonUpload(type: MyTypes.items)
                ],
              ),
            ),
          ),
        ));
  }
}
