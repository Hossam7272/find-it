import 'package:find_it/core/widgets/cards_items_view.dart';
import 'package:find_it/features/search/ui/screens/home_search.dart';
import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/action_app_bar.dart';
import '../../../core/widgets/app_bar_title.dart';
import '../../../core/widgets/leading_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeTitleAppBar(
          userName: '${savey.getString('user_name')}',
        ),
        leading: const HomeLeadingAppBar(),
        actions: const[
           HomeActionAppBar(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              HomeSearch(),
              SizedBox(
                height: 20.h,
              ),
              CardsItemsView(isHome: true)
            ],
          ),
        ),
      ),
    );
  }
}
