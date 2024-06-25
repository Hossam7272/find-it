import 'package:find_it/features/search/logic/search_child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theming/app_color.dart';

class FilterChildren extends StatelessWidget {
  const FilterChildren({super.key});

  @override
  Widget build(BuildContext context) {
    MySearchChildController controller = Get.find();
    DateTime date = DateTime.now();
    return   IconButton(
      onPressed: (){
        Get.defaultDialog(
            title: 'Filteration',
            middleText: 'filter',
            onConfirm: ()=> controller.filterChildren(),
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
                  GetBuilder<MySearchChildController>(
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
                  ),
                  GetBuilder<MySearchChildController>(
                      builder: (controller){
                        return ListTile(
                          title: const Text('Gender'),
                          trailing: DropdownButton(
                            value: controller.selectedGender,
                            onChanged: (newValue) {
                              controller.chooseGender(newValue);
                            },
                            items: controller.gender.map((gender) {
                              return DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              );
                            }).toList(),
                          ),
                        );

                      }
                  ),

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
