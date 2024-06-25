import 'package:find_it/core/theming/app_color.dart';
import 'package:find_it/core/theming/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyForm extends StatelessWidget {
  String txt;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  void Function(String)? onChanged;
  TextEditingController? controller = TextEditingController();
  String? Function(String?)? validator;
  bool isPassHidden;
  MyForm({super.key,required this.txt,this.keyboardType, this.controller,this.validator,this.onChanged,this.suffixIcon , this.isPassHidden = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        obscureText: isPassHidden,
        onFieldSubmitted: onChanged ,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColors.myGrayLight,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 7.h,
          ),
          hintText: txt,
          hintStyle: MyStyles.font16w400,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );

  }
}
