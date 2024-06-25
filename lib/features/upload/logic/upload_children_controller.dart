import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/features/lost_children/logic/children_controller.dart';
import 'package:find_it/features/upload/logic/upload_image_function.dart';
import 'package:find_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/networking/api.dart';

class UploadChildrenController extends GetxController {
  ChildrenController childrenController = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  DateTime? newDate;
  Connect con = Connect();
  String? gender;

  setGender(String value) {
    gender = value;
    update();
  }

  GlobalKey<FormState> gk = GlobalKey();
  bool isLoaded = false;
  loading() {
    isLoaded = true;
    update();
  }

  uploadItem() async {
    if (gk.currentState!.validate()) {
      if (newDate == null) {
        Get.defaultDialog(middleText: 'Please select a date');
      } else if (UploadImageFunction.image == null) {
        Get.defaultDialog(middleText: 'Please choose a image');
      } else if(gender == null){
        Get.defaultDialog(middleText: 'Please choose your gender');
      }
      else {
        loading();
        var r = await con.getfile4(
            ApiConst.addChildren,
            {
              'name': name.text,
              'location': location.text,
              'lost_time': newDate.toString(),
              'user_id': savey.getString('id'),
              'gender': gender
            },
            UploadImageFunction.image!);
        if (r['status'] == 'success') {
          childrenController.viewChildren();
          name.clear();
          location.clear();
          UploadImageFunction.image = null;
          isLoaded = false;
        }
      }
    }
    update();
  }
}
