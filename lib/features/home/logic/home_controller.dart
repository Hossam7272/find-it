import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/features/home/data/item_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  Connect connect = Connect();
  List items = [];
  int pageNumber = 1;


  viewItems()async{
    items = [];
    int pageNumber = 1;
    var response = await connect.getData(url: '${ApiConst.serverName}/items/view.php?page=$pageNumber');
    items.addAll(response['data'].map((item) => Data.fromJson(item)).toList());
    pageNumber++;
    update();
  }








  @override
  void onInit() {
    super.onInit();
    viewItems();
  }
}