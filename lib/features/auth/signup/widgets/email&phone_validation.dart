import 'package:find_it/features/auth/signup/logic/signup_controller.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

SignUpController controller = Get.find();
emailValidation(String value){
  SignUpController controller = Get.find();
  if(value.isEmpty || value == null){
    return 'please enter your email';
  }else if(!isEmail(value)){
    return 'please enter a valid email';
  }
}



phoneValidation(String value){
  SignUpController controller = Get.find();
  if(value.isEmpty || value == null){
    return 'please enter your phone number';
  }else if(!isNumeric(value)){
    return 'please enter a numeric value';
  }
}


dateValidation(String value){
  if(value.isEmpty || value == null){
    return 'please enter your birthdate';
  }else if(!isDate(value)){
    return 'please enter a valid date ex: yyyy-mm-dd';
  }
}