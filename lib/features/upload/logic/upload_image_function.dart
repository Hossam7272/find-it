import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageFunction extends GetxController{
  static XFile? xfile;
  static File? image;
  static galleryOneImagePicker() async {
    try {
      xfile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      image = File(xfile!.path);
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  static cameraImagePicker() async {
    try {
      xfile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      image = File(xfile!.path);

    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  updateWidgetGallery(){
    update();
  }
  updateWidgetCamera(){
    update();
  }
}