import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:find_it/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionState = 0.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        Get.snackbar('Wifi connection', 'Wifi connection' ,  backgroundColor: AppColors.myGreen);
      case ConnectivityResult.mobile:
        Get.snackbar('Mobile connection', 'Mobile connection' , backgroundColor: AppColors.GreenDC);
      case ConnectivityResult.none:
        Get.snackbar('No Internet connection', 'No Internet connection' , backgroundColor: Colors.red);
        break;
      default:
        print(connectionState.value);
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription!.cancel();
  }
}
