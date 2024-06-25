import 'package:find_it/features/lost_children/logic/children_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/networking/api.dart';
import '../../../core/networking/api_const.dart';
import '../../lost_children/data/children_model.dart';

class MySearchChildController extends GetxController{
  ChildrenController controller = Get.find();
  TextEditingController searchController = TextEditingController();
  List searchList = [];
  Connect connect = Connect();
  bool? filter;
  DateTime? newDate;
  String? selectedLocation;
  String? selectedGender;
  List<String> gender = ['','male','female'];

  chooseGender( value){
    selectedGender = value;
    update();

  }
  chooseLocation( value){
    selectedLocation = value;
    update();

  }


  search(String text){
    searchList = [];
    for(int i=0;i<controller.children.length;i++){
      if(controller.children[i].name == text ){
        searchList.add(controller.children[i]);
      }
    }
    update();
  }

  Set myLocations = {''};
  getLocations() async{
    var response = await connect.getData(url: ApiConst.childLocation);
    for(int i = 0 ; i<response['data'].length ; i++){
      myLocations.add(response['data'][i]['location']);
    }
  }
  filterChildren() async{
    print('dfdf');
    searchList = [];
    var response = await connect.postData( '${ApiConst.serverName}/children/filter.php',{
      'date'      : newDate == null ? '' : newDate.toString(),
      'name'      : searchController.text,
      'location'  : selectedLocation == null ? '' : selectedLocation,
      'gender'    : selectedGender == null ? '' : selectedGender,

    });
    if(response['status'] == 'success'){
      searchList.addAll(response['data'].map((item) => childData.fromJson(item)).toList());
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




