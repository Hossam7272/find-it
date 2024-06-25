import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:get/get.dart';

import '../data/children_model.dart';

class ChildrenController extends GetxController{

  Connect connect = Connect();
  List children = [];
  int pageNumber = 1;
  DateTime? newDate;
  bool? filter;


  viewChildren()async{
    children = [];
    int pageNumber = 1;
    var response = await connect.getData(url: '${ApiConst.serverName}/children/view.php?page=$pageNumber');
    children = response['data'].map((child) => childData.fromJson(child)).toList();
    pageNumber++;
    update();

  }


  filterDate() async{
    children = [];
    var response = await connect.postData( '${ApiConst.serverName}/children/filter.php',{'date' : newDate.toString() });
    if(response['status'] == 'success'){
      children.addAll(response['data'].map((item) => childData.fromJson(item)).toList());
    }else{
      filter = false;
    }
    update();
  }










  @override
  void onInit() {
    super.onInit();
    viewChildren();
  }
}