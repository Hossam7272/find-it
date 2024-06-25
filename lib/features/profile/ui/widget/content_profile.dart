import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routing/routes.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.cartScreen);
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/img/cart_icon.svg',
              ),
              title: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/img/chat_icon.svg',
              ),
              title: Text(
                "Chat",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.settingScreen);
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/img/settings_icon.svg',
              ),
              title: Text(
                "settings",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context,Routes.qrCodeScreen);
          },
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              leading: const Icon(Icons.qr_code),
              title: Text(
                "QR CODE",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
