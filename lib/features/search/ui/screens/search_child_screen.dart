import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/core/widgets/myform.dart';
import 'package:find_it/features/search/logic/search_child_controller.dart';
import 'package:find_it/features/search/logic/search_items_controller.dart';
import 'package:find_it/features/search/ui/widgets/filter_children.dart';
import 'package:find_it/features/search/ui/widgets/filter_items.dart';
import 'package:find_it/features/search/ui/widgets/show_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SearchChildScreen extends StatefulWidget {
  const SearchChildScreen({super.key});

  @override
  State<SearchChildScreen> createState() => _SearchChildScreenState();

}

class _SearchChildScreenState extends State<SearchChildScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.delete<MySearchChildController>();
  }
  @override
  Widget build(BuildContext context) {
    MySearchChildController controller = Get.put(MySearchChildController());
    return Scaffold(
      backgroundColor: AppColors.myWhiteLight,
      appBar: AppBar(
        backgroundColor: AppColors.myWhiteLight,
        automaticallyImplyLeading: false,
        title: Text(
          "Search Children Page",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
              title: MyForm(
                controller: controller.searchController,
                txt: 'Search',
                onChanged: (val){
                  controller.search(val);
                },
              ),
              trailing: const FilterChildren()
          ),
          ShowCards(type: true,)
        ],
      ),
    );
  }
}
