import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  Connect connect = Connect();


  changePassword()async{
    if(newPasswordController.text == repeatPasswordController.text){
      var r = await connect.postData(ApiConst.changePassword, {
        'id'          : savey.getString('id'),
        'newPassword' : newPasswordController.text,
      });

      if(r['status'] == 'success'){
        Get.defaultDialog(middleText: 'Updated Successfully');
        newPasswordController.clear();
        repeatPasswordController.clear();
      }
    }else{
      Get.defaultDialog(middleText: 'The repeat password must be typical to the new password');
    }


  }
}