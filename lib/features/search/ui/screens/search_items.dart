import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/core/widgets/myform.dart';
import 'package:find_it/features/search/logic/search_items_controller.dart';
import 'package:find_it/features/search/ui/widgets/filter_items.dart';
import 'package:find_it/features/search/ui/widgets/show_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({super.key});

  @override
  State<SearchItemScreen> createState() => _SearchItemScreenState();

}

class _SearchItemScreenState extends State<SearchItemScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.delete<MySearchItemController>();
  }
  @override
  Widget build(BuildContext context) {
    MySearchItemController controller = Get.put(MySearchItemController());

    return Scaffold(
      backgroundColor: AppColors.myWhiteLight,
      appBar: AppBar(
        backgroundColor: AppColors.myWhiteLight,
        automaticallyImplyLeading: false,
        title: Text(
          "Search Items Page",
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
            trailing: const FilterItems()
          ),
          ShowCards()
        ],
      ),
    );
  }
}
