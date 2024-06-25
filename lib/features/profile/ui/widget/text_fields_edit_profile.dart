import 'package:country_picker/country_picker.dart';
import 'package:find_it/features/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/theming/my_styles.dart';
import 'custom_form_field.dart';

class TextFiledsEditProfile extends StatelessWidget {
  const TextFiledsEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.h,
        ),
        Text(
            "Edit Profile",
            style: MyStyles.heebofont24w500black
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
            "Personal Information",
            style: MyStyles.heebofont16w500
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomFormField(
                hint: controller.user_name,
                controller: controller.nameController,
                onTap: () {},
              ),
            ),
            SizedBox(
              width: 9.w,
            ),
            Expanded(
              flex: 3,
              child: CustomFormField(
                hint: controller.user_username,
                controller: controller.userNameController,
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset('images/email_icon.svg'),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: CustomFormField(
                hint: controller.user_email,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset('images/call_icon.svg'),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 13.w,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType:
                    PhoneInputSelectorType.BOTTOM_SHEET,
                    useBottomSheetSafeArea: true,
                    useEmoji: true,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  textFieldController: controller.phoneController,
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  inputDecoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h, horizontal: 13.w),
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: controller.user_phone,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset('images/location_icon.svg'),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Country",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: CustomFormField(
                hint: controller.user_country,
                controller: controller.countryController,
                keyboardType: TextInputType.phone,
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      flagSize: 25,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                      ),
                      bottomSheetHeight: 0.6.sh,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                      //Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff0BCE83),
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff0BCE83),
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff0BCE83),
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                    onSelect: (country) {
                      controller.countryController.text = country.name;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
