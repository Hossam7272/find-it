import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyImagePicker{
  XFile? xfile;
  static File? image;
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
}