import 'package:find_it/features/upload/logic/upload_image_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/theming/my_styles.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});
  @override
  Widget build(BuildContext context) {
    UploadImageFunction controller = Get.put(UploadImageFunction());
    return Column(
      children: [
        Text("Upload a photo", style: MyStyles.font24w700),
        SizedBox(
          height: 12.h,
        ),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(45.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(45.r),
                onTap: () async {
                  await UploadImageFunction.galleryOneImagePicker();
                  controller.updateWidgetGallery();
                },
                child: GetBuilder<UploadImageFunction>(
                  builder: (controller){
                    return Container(
                        height: 200.h,
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.r),
                          border: Border.all(
                            color: const Color(0xff0BCE83),
                          ),
                        ),
                        child: UploadImageFunction.image != null
                            ? Row(
                          children: [
                            Image.file(UploadImageFunction.image!,fit: BoxFit.cover,),
                            TextButton(onPressed: (){
                              UploadImageFunction.image = null;
                              controller.updateWidgetGallery();
                            }, child: const Text('Cancel'))
                          ],
                        )
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: const Color(0xff9E9E9E),
                              size: 30.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Select file",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xff9E9E9E),
                              ),
                            ),
                          ],
                        )
                    );
                  },
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: const Color(0xffd7d7d7).withOpacity(0.5),
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff616161).withOpacity(0.7),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: const Color(0xffd7d7d7).withOpacity(0.5),
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: const Color(0xffE7FAF4),
              borderRadius: BorderRadius.circular(45.r),
              child: GetBuilder<UploadImageFunction>(
                builder: (controller){
                  return InkWell(
                    borderRadius: BorderRadius.circular(45.r),
                    onTap: () async{
                      await UploadImageFunction.cameraImagePicker();
                      controller.updateWidgetCamera();
                    },
                    child: UploadImageFunction.image != null ?
                    Row(
                      children: [
                        SvgPicture.asset('assets/img/success.svg'),
                        TextButton(onPressed: (){
                          UploadImageFunction.image = null;
                          controller.updateWidgetCamera();
                        }, child: const Text('Cancel'))
                      ],
                    )
                        :Container(
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
                  );
                },
              )
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
