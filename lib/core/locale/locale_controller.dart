import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController{
  Locale intialLocale = savey.getString('lang') == 'ar' ? const Locale("ar") : const Locale('en');
  changeLang(String codeLang){
    Locale locale = Locale(codeLang);
    savey.setString("lang", codeLang);
    Get.updateLocale(locale);

  }
}