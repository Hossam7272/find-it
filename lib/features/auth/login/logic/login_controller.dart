import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routing/routes.dart';

class LoginController extends GetxController{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Connect connect = Connect();
  bool isLoaded = false;
  loading(){
    isLoaded = !isLoaded;
    update();
  }
  login() async{
    if(formKey.currentState!.validate()){
      loading();
      var r = await connect.postData(ApiConst.login, {
        'username' : usernameController.text,
        'password' : passwordController.text
      });

      if(r['status'] == 'success'){
        savey.setString('id' , r['data']['id']);
        savey.setString('user_name', r['data']['username']);
        savey.setString('email', r['data']['email']);
        savey.setString('name', r['data']['name']);
        savey.setString('phone', r['data']['phone']);
        savey.setString('country', r['data']['country']); 
        savey.setString('profileImage', r['data']['profile_picture']);
        Get.delete<LoginController>();
        Get.offNamed(Routes.bottomNav);
        isLoaded = false;
      }else{
        loading();
        Get.defaultDialog(
          middleText: 'Wrong password or email',backgroundColor: Colors.red
        );
      }
    }

  }

  bool isPassHidden = true;
  showPass(){
    isPassHidden = !isPassHidden;
    update();
  }
}