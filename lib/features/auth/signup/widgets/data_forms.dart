import 'package:find_it/features/auth/signup/logic/signup_controller.dart';
import 'package:find_it/features/auth/signup/widgets/email&phone_validation.dart';
import 'package:find_it/features/auth/signup/widgets/password_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/myform.dart';

class DataForms extends StatelessWidget {
  const DataForms({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyForm(
                    controller: controller.firstName,
                    txt: 'First name',validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'enter firstname';
                    }
                  },)
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyForm(
                    controller: controller.lastName,
                    txt: 'Last name',validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'enter lastname';
                    }
                  },)
              ),
            ],
          ),
          MyForm(txt: 'email address',validator: (value){return emailValidation(value!);},controller: controller.emailController,),
          MyForm(
            txt: 'username',
            validator: (value){if(value!.isEmpty || value == null) return 'enter firstname';},
            controller: controller.usernameController,),
          MyForm(txt: 'mobile number',validator: (value){return phoneValidation(value!);},controller: controller.phoneController,),
          MyForm(txt: 'password',validator: (value){return passwordValidation(value!);},controller: controller.passwordController,),
          MyForm(txt: 'Date' ,validator: (value){return dateValidation(value!);},controller: controller.dateController,),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}
