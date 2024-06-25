import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/features/upload/logic/upload_image_function.dart';
import 'package:find_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/networking/api.dart';

class UploadItemController extends GetxController{
  
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  Connect con = Connect();
  DateTime? newDate;
  GlobalKey<FormState> gk = GlobalKey();
  bool isLoaded = false;
  loading(){
    isLoaded = true;
    update();
  }
  uploadItem() async{
   if(gk.currentState!.validate()){
     if(newDate == null){
       Get.defaultDialog(middleText: 'Please select a date');
     }else if(UploadImageFunction.image == null){
       Get.defaultDialog(middleText: 'Please choose a image');
     }
    else{
      loading();
       var r = await con.getfile(ApiConst.addItem, {
         'name'        : name.text,
         'location'    : location.text,
         'lost_time'   : newDate.toString() ,
         'user_id'     : savey.getString('id') ,
       },UploadImageFunction.image!);
       if(r['status'] == 'success'){
         name.clear();
         location.clear();
         UploadImageFunction.image = null;
         isLoaded = false;
       }
     }
   }
   update();
  }

//-------------------location
//
//  getPermissions()async{
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if(!serviceEnabled){
//       return Future.error('Location services are disabled');
//     }else{
//       permission = await Geolocator.checkPermission();
//       if(permission == LocationPermission.denied){
//         permission = await Geolocator.requestPermission();
//         if(permission == LocationPermission.denied)  return Future.error('Location permissions are denied');
//       }
//       if(permission == LocationPermission.deniedForever) return Future.error('Location permission are permanently denied, we cannot request permissions');
//
//     }
//  }
//  getCurrentLocation()async{
//     Position position = await Geolocator.getCurrentPosition();
//
//  }


}