import 'package:find_it/core/theming/my_styles.dart';
import 'package:find_it/features/upload/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theming/app_color.dart';
import '../logic/upload_children_controller.dart';
import '../widgets/button_upload.dart';
import '../widgets/upload_forms.dart';

class UploadChildrenScreen extends StatefulWidget {
  const UploadChildrenScreen({super.key});

  @override
  State<UploadChildrenScreen> createState() => _UploadChildrenScreenState();
}

class _UploadChildrenScreenState extends State<UploadChildrenScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.delete<UploadChildrenController>();
  }
  @override
  Widget build(BuildContext context) {
    UploadChildrenController controller = Get.put(UploadChildrenController());
    DateTime date = DateTime.now();
    return Scaffold(
      backgroundColor: AppColors.myWhiteLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.myWhiteLight,
        title: Text("Upload Child",
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
                GetBuilder<UploadChildrenController>(builder: (controller) {
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Text('male: '),
                          title: Radio(
                            value: 'male',
                            groupValue: controller.gender,
                            onChanged: (value) {
                              controller.setGender(value!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Text('female: '),
                          title: Radio(
                            value: 'female',
                            groupValue: controller.gender,
                            onChanged: (value) {
                              controller.setGender(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10.h,),
                ButtonUpload(type: MyTypes.children)
              ],
            ),
          ),
        ),
      )
    );
  }
}
