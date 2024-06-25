import 'package:find_it/core/networking/api.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/features/home/data/item_model.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardController extends GetxController{

  Connect connect = Connect();
  List myItems    = [];
  List myChildren = [];

  getMyItems()async{
    var response = await connect.postData(ApiConst.viewItemsById , {'id' : '${savey.getString('id')}'});
    myItems = response['data'].map((item) => Data.fromJson(item)).toList();
    update();
  }


  getMyChildren()async{
    var response = await connect.postData(ApiConst.viewChildrenById , {'id' : '${savey.getString('id')}'});
    myChildren = response['data'].map((item) => Data.fromJson(item)).toList();
    update();
  }

  deleteItem(String id , String name , context)async{
    var response = await connect.postData(ApiConst.deleteItem, {
      'id' : id,
      'name' : name
    });
    checkSuccess(response , context);
  }
  deleteChild(String id , String name , context)async{
    var response = await connect.postData(ApiConst.deleteChild, {
      'id' : id,
      'name' : name
    });
    checkSuccess(response , context);
  }
  checkSuccess(var r, context){
    if(r['status'] == 'success' ){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item deleted Successfully')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to delete Item')));
    }

  }

}