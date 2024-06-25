import 'dart:io';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/networking/api.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String user_name = savey.getString('name')!;
  String user_username = savey.getString('user_name')!;
  String user_phone = savey.getString('phone')!;
  String user_email = savey.getString('email')!;
  String user_country = savey.getString('country')!;
  Connect con = Connect();
  XFile? xfile;
  File? image;
  galleryOneImagePicker() async {
    try {
      xfile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      image = File(xfile!.path);
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  cameraImagePicker() async {
    try {
      xfile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      image = File(xfile!.path);

    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }


  editProfile()async{
    var response = await con.getfile3(ApiConst.editProfile, {
      'id'          : savey.getString('id'),
      'name'        : nameController.text.isEmpty     ? user_name     : nameController.text,
      'username'    : userNameController.text.isEmpty ? user_username : userNameController.text,
      'email'       : emailController.text.isEmpty    ? user_email    : emailController.text,
      'phone'       : phoneController.text.isEmpty    ? user_phone    : phoneController.text,
      'country'     : countryController.text.isEmpty  ? user_country  : countryController.text
    },image!);

    if(response['status'] == 'success' ){
      Get.defaultDialog(middleText: 'User Updated');

    }else{
      Get.defaultDialog(middleText: 'User not Updated');
    }

    nameController.clear();
    userNameController.clear();
    emailController.clear();
    countryController.clear();
    phoneController.clear();
  }
}