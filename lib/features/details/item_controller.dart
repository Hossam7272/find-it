import 'dart:io';

import 'package:find_it/core/networking/api.dart';
import 'package:find_it/features/details/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/networking/api_const.dart';

class ItemController extends GetxController{
  Connect connect = Connect();
  User? user;
  getUserById(String id)async{
    var response = await connect.postData( ApiConst.user , {'userId' : id});
    if(response['status'] == 'success'){
      user = User.fromJson(response['data']);
      update();
    }
  }

  void sendWhatsAppMessage({required String phone, required String message, required context}) async {
     Uri url() {
      if (Platform.isIOS) {
        return Uri.parse("whatsapp://wa.me/+02$phone/?text=${Uri.parse(message)}");
      } else {
        return Uri.parse("whatsapp://send?phone=+02$phone&text=$message");
      }
    }
    await canLaunchUrl(url()) ? launchUrl(url()) : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text('There is no WhatsApp on your Device!')));
  }

}