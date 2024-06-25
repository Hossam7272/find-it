import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:find_it/core/networking/api_const.dart';
import 'package:find_it/features/card/card_controller.dart';
import 'package:find_it/features/card/ui/widgets/build_section.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool isLostItemsVisible = false;
  bool isFoundItemsVisible = false;

  CardController controller = Get.put(CardController() , permanent: false);

  @override
  void initState() {
    super.initState();
    controller.getMyItems();
    controller.getMyChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' My Cart ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200.r),
              child: FancyShimmerImage(
                imageUrl: '${ApiConst.imageFolder}/${savey.getString('profileImage')}',
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${savey.getString('user_name')}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GetBuilder<CardController>(
              builder: (controller){
                if(controller.myItems.isEmpty && controller.myChildren.isEmpty){
                  return const Center(child: Text('No Items found'),);
                }else{
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    children: [
                      buildSection(
                        title: 'Lost Items',
                        isItems: true,
                        items: controller.myItems,
                        isVisible: isLostItemsVisible,
                        onTap: () {
                          setState(() {
                            isLostItemsVisible = !isLostItemsVisible;
                          });
                        },context: context, controller: controller,
                      ),
                      SizedBox(height: 20.h),
                      buildSection(
                        isItems: false,
                        title: 'Lost Children',
                        items: controller.myChildren,
                        isVisible: isFoundItemsVisible,
                        onTap: () {
                          setState(() {
                            isFoundItemsVisible = !isFoundItemsVisible;
                          });
                        }, context: context, controller: controller,

                      ),
                    ],
                  );
                }
              },
            )
          ),
        ],
      ),
    );
  }


}
