import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hint,
    required this.onTap,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onSubmit,
    this.prefix,
    this.maxLines,
    this.radius = 30,
    this.suffix,
    this.obscure = false,
    this.fillColor = Colors.white,
  });

  final String hint;
  final int? maxLines;
  final double radius;
  final String? Function(String?)? validator, onSubmit;
  final void Function() onTap;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Icon? prefix;
  final IconButton? suffix;
  final bool obscure;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          onTap: onTap,
          validator: validator,
          onFieldSubmitted: onSubmit,
          onTapOutside: (val) {
            FocusScope.of(context).unfocus();
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: fillColor,
            suffixIcon: suffix,
            prefixIcon: prefix,
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(radius.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(radius.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(radius.r),
            ),
          ),
        )
      ],
    );
  }
}
