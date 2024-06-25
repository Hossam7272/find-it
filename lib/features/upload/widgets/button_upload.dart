import 'package:find_it/features/upload/logic/upload_children_controller.dart';
import 'package:find_it/features/upload/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/my_styles.dart';
import '../../../core/widgets/mybtn.dart';
import '../logic/upload_image_function.dart';
import '../logic/upload_items_controller.dart';

class ButtonUpload extends StatelessWidget {
  MyTypes type;
  ButtonUpload({super.key,required this.type});

  @override
  Widget build(BuildContext context) {
    UploadImageFunction imageController = Get.find();
    return  type == MyTypes.items ? GetBuilder<UploadItemController>(
        builder: (controller){
          return  MyBtn(
              onTap: () async{
                await controller.uploadItem();
                imageController.updateWidgetGallery();
                imageController.updateWidgetCamera();
              },
              myChild: controller.isLoaded ? const CircularProgressIndicator(): Text('Upload',style: MyStyles.font18w500)
          );
        }
    ) : GetBuilder<UploadChildrenController>(
        builder: (controller){
          return  MyBtn(
              onTap: () async{
                await controller.uploadItem();
                imageController.updateWidgetGallery();
                imageController.updateWidgetCamera();              },
              myChild: controller.isLoaded ? const CircularProgressIndicator(): Text('Upload',style: MyStyles.font18w500)
          );
        }
    );;
  }
}
enum MyTypes {
  children,items
}