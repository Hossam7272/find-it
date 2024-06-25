import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routing/routes.dart';

class HomeLeadingAppBar extends StatelessWidget {
  const HomeLeadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w ),
      child: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, Routes.profileScreen);
          },
          icon: const Icon(Icons.person,size: 30,)
      ),
    );
  }
}
