import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/settings/ui/setting.dart';

class HomeActionAppBar extends StatelessWidget {
  const HomeActionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 20.w),
      child:    IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
          },
          icon: const Icon(Icons.settings_outlined,size: 30,)
      ),
    );
  }
}
