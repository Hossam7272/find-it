import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/networking/api_const.dart';
import '../../../lost_children/ui/widgets/lost_card.dart';



Widget buildSection({
  required String title,
  required bool isItems,
  required List items,
  required context,
  required controller,
  required bool isVisible,
  required VoidCallback onTap,
}) {
  List displayedItems = isVisible ? items : items.take(2).toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              isVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 30,
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.zero,
        children: displayedItems.map((item) {
          return InkWell(
            onTap: (){
              Get.defaultDialog(
                  middleText: 'Are you sure that you need to delete this',
                  cancel:  ElevatedButton(
                      onPressed: (){
                        if(isItems == true){
                          controller.deleteItem(item.id, item.img,context);
                          Get.back();
                        }else{
                          controller.deleteChild(item.id, item.img,context);
                          Get.back();
                        }
                      }, child: const Text('Yes'))
              );
            },
            child: LostCard(
                date: '${item.date}',
                location: '${item.location}',
                Details: '${item.name}',
                img: '${ApiConst.imageFolder}/${item.img}'),
          );
        }).toList(),
      ),
    ],
  );
}