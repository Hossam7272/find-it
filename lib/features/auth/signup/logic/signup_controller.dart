import 'dart:io';

import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/core/widgets/mybtn.dart';
import 'package:find_it/features/auth/signup/logic/image_picker.dart';
import 'package:find_it/features/auth/signup/logic/set_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/my_styles.dart';

class SignUpController extends GetxController{

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  Connect connect = Connect();

  signUp(context) async{
    if(formKey.currentState!.validate()){
      if(MyImagePicker.image == null){
        Get.defaultDialog(
          middleText: 'Please insert your profile picture'
        );
      }else{
        var r = await connect.getfile2(ApiConst.signup, {
          'name'            : firstName.text + lastName.text,
          'username'        : usernameController.text,
          'email'           : usernameController.text,
          'password'        : passwordController.text,
          'phone'           : phoneController.text,
          'date'            : dateController.text,
          'country'         : 'egypt'
        }, MyImagePicker.image!);
        if(r['status'] == 'success'){
          MyQrCode.setQrCode(data: usernameController.text, phone: phoneController.text);
          Get.defaultDialog(
              title: "Success Register",
              middleText: '',
              actions: [
                MyBtn(onTap: (){
                  Get.delete<SignUpController>();
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                }, myChild: Text('back to login',style: MyStyles.font18w500,))
              ]
          );
        }else if(r['status'] == 'username already exist'){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  const AlertDialog(
                content: Text("username already exist"),
              );
            },
          );
        }else if(r['status'] == 'phone already used'){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  const AlertDialog(
                content: Text("phone number already used"),
              );
            },
          );
        }
      }
    }

  }
  Future<String?> extractText(File? IDFile)async{
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFilePath(IDFile!.path);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    print(recognizedText.text);


  }
}