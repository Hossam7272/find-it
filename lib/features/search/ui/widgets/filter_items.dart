import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theming/app_color.dart';
import '../../logic/search_items_controller.dart';

class FilterItems extends StatelessWidget {
  const FilterItems({super.key});

  @override
  Widget build(BuildContext context) {
    MySearchItemController controller = Get.find();
    DateTime date = DateTime.now();
    return   IconButton(
      onPressed: (){
      Get.defaultDialog(
          title: 'Filteration',
          middleText: 'filter',
          onConfirm: ()=> controller.filterItems(),
          actions: [
            Column(
              children: [
                ListTile(
                  title: const Text('Date of upload'),
                  trailing: IconButton(
                    onPressed: () async {
                      controller.newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(200),
                          lastDate: date);
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ),
                GetBuilder<MySearchItemController>(
                    builder: (controller){
                      return ListTile(
                        title: const Text('Location'),
                        trailing: DropdownButton(
                          value: controller.selectedLocation,
                          onChanged: (newValue) {
                            controller.chooseLocation(newValue);
                          },
                          items: controller.myLocations.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                        ),
                      );

                    }
                )
                // MyBtn(onTap: (){controller.viewItems();}, txt: 'Restore to default')
              ],
            )

          ]

      );
    },
      icon: const Icon(Icons.filter_alt,color: AppColors.myGreen,),
    );
  }
}
