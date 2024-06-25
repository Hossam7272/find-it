import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:find_it/features/home/ui/home.dart';
import 'package:find_it/features/lost_children/ui/screens/lost_children_screen.dart';
import 'package:find_it/features/upload/screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theming/app_color.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Home(),
      const LostChildrenScreen(),
      const UploadScreen()
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items:  [
          TabItem(icon: const Icon(Icons.home,) , title: 'home'.tr),
          TabItem(icon: const Icon(Icons.child_care) , title: 'child'.tr),
          TabItem(icon: const Icon(Icons.upload) , title: 'upload'.tr),
        ],
        initialActiveIndex: _currentIndex,
        backgroundColor: AppColors.myGreen,
        color: Colors.black,         
        onTap: _changeItem,
        height: 70.h,
      ),
    );
  }

  void _changeItem(int value){
    setState(() {
      _currentIndex = value;
    });
  }
}