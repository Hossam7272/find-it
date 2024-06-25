import 'package:find_it/core/networking/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/networking/api_const.dart';
import '../../home/data/item_model.dart';
import '../../home/logic/home_controller.dart';

class MySearchItemController extends GetxController{
  HomeController controller = Get.find();
  TextEditingController searchController = TextEditingController();
  List searchList = [];
  Connect connect = Connect();
  bool? filter;
  DateTime? newDate;
  String? selectedLocation;

  chooseLocation( value){
    selectedLocation = value;
    update();

  }


  search(String text){
    searchList = [];
    for(int i=0;i<controller.items.length;i++){
      if(controller.items[i].name == text ){
        searchList.add(controller.items[i]);
      }
    }
    update();
  }

  Set myLocations = {''};
  getLocations() async{
    var response = await connect.getData(url: '${ApiConst.serverName}/items/get_location.php');
    for(int i = 0 ; i<response['data'].length ; i++){
      myLocations.add(response['data'][i]['location']);
    }
  }

  filterItems() async{
    searchList = [];
    var response = await connect.postData( '${ApiConst.serverName}/items/filter.php',{
      'date'      : newDate == null ? '' : newDate.toString(),
      'name'      : searchController.text,
      'location'  : selectedLocation == null ? '' : selectedLocation
    });
    if(response['status'] == 'success'){
      searchList.addAll(response['data'].map((item) => Data.fromJson(item)).toList());
      newDate = null;
      selectedLocation = '';
    }else{
      filter = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }
}