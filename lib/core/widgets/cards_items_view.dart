import 'package:find_it/features/lost_children/logic/children_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../features/lost_children/ui/widgets/lost_card.dart';
import '../networking/api_const.dart';
import '../routing/routes.dart';
import '../../features/home/logic/home_controller.dart';

class CardsItemsView extends StatelessWidget {
  bool isHome = true;
  CardsItemsView({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController() ,permanent: true);
    Get.put(ChildrenController() , permanent: true);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      child: isHome == true
          ? GetBuilder<HomeController>(builder: (controller) {
              if (controller.items.isEmpty) {
                return Shimmer.fromColors(
                    highlightColor: Colors.grey.shade100,
                    baseColor: Colors.grey.shade300,
                      child: GridView.count(
                      mainAxisSpacing: 40.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        for (int i = 0; i < 6; i++) ...{
                          Material(
                            elevation: 1,
                            borderRadius: BorderRadius.circular(15),
                          )
                        }
                      ],
                    ));
              } else {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      controller.viewItems();
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.pageNumber = 1;
                      controller.items = [];
                      return Future.delayed(const Duration(seconds: 2),
                          () => controller.viewItems());
                    },
                    child: GridView.count(
                      mainAxisSpacing: 40.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        for (int i = 0; i < controller.items.length; i++) ...{
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.itemsDetailsScreen,
                                  arguments: controller.items[i]);
                            },
                            child: LostCard(
                              date: controller.items[i].date,
                              location: controller.items[i].location,
                              Details: controller.items[i].name,
                              img:
                                  '${ApiConst.imageFolder}/${controller.items[i].img}',
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                );
              }
            })
          : GetBuilder<ChildrenController>(builder: (controller) {
              if (controller.children.isEmpty) {
                return Shimmer.fromColors(
                    highlightColor: Colors.grey.shade100,
                    baseColor: Colors.grey.shade300,
                    child: GridView.count(
                      mainAxisSpacing: 40.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        for (int i = 0; i < 6; i++) ...{
                          Material(
                            elevation: 1,
                            borderRadius: BorderRadius.circular(15),
                          )
                        }
                      ],
                    ));
              } else {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      controller.viewChildren();
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: () {
                      controller.pageNumber = 1;
                      controller.children = [];
                      return Future.delayed(const Duration(seconds: 2),
                          () => controller.viewChildren());
                    },
                    child: GridView.count(
                      mainAxisSpacing: 40.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        for (int i = 0;
                            i < controller.children.length;
                            i++) ...{
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.itemsDetailsScreen,
                                  arguments: controller.children[i]);
                            },
                            child: LostCard(
                              date: controller.children[i].date,
                              location: controller.children[i].location,
                              Details: controller.children[i].name,
                              img:
                                  '${ApiConst.imageFolder}/${controller.children[i].img}',
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                );
              }
            }),
    );
  }
}
