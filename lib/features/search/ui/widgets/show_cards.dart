import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/networking/api_const.dart';
import '../../../../core/routing/routes.dart';
import '../../../lost_children/ui/widgets/lost_card.dart';
import '../../logic/search_child_controller.dart';
import '../../logic/search_items_controller.dart';

class ShowCards extends StatelessWidget {
  bool type;
  ShowCards({super.key,this.type = false});

  @override
  Widget build(BuildContext context) {

    return  type ?
    GetBuilder<MySearchChildController>(
        builder: (controller){
          return controller.searchList.isEmpty ? const Center(child: Text('No items found')) : Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 40.h),
            decoration: BoxDecoration(
              color: const Color(0xff85E2BE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90.r),
                topRight: Radius.circular(90.r),
              ),
            ),
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 35.h,
                crossAxisSpacing: 20.w,
                crossAxisCount: 2,
                children: [
                  for(int i=0 ; i<controller.searchList.length;i++) ...{
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                            context, Routes.itemsDetailsScreen,
                            arguments: controller.searchList[i]);
                      },
                      child: LostCard(
                        date: controller.searchList[i].date,
                        location: controller.searchList[i].location,
                        Details: controller.searchList[i].name,
                        img: '${ApiConst.imageFolder}/${controller.searchList[i].img}',

                      ),
                    )
                  }
                ],
              ),
            ),
          );
        }
    ):
    GetBuilder<MySearchItemController>(
        builder: (controller){
          return controller.searchList.isEmpty ? const Center(child: Text('No items found')) : Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 40.h),
            decoration: BoxDecoration(
              color: const Color(0xff85E2BE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90.r),
                topRight: Radius.circular(90.r),
              ),
            ),
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 35.h,
                crossAxisSpacing: 20.w,
                crossAxisCount: 2,
                children: [
                  for(int i=0 ; i<controller.searchList.length;i++) ...{
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                            context, Routes.itemsDetailsScreen,
                            arguments: controller.searchList[i]);
                      },
                      child:    LostCard(
                        date: controller.searchList[i].date,
                        location: controller.searchList[i].location,
                        Details: controller.searchList[i].name,
                        img: '${ApiConst.imageFolder}/${controller.searchList[i].img}',

                      ),
                    )
                  }
                ],
              ),
            ),
          );
        }
    );
  }
}
