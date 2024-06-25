import 'package:string_validator/string_validator.dart';
passwordValidation(String value){
  if(value.isEmpty || value == null){
    return 'please enter your password';
  }else if(value.length <= 8){
    return 'please enter at least 8 characters';
  }else if(specialCharacterfound(value)){
    return 'please enter at least a special character';
  }else if(upperCase(value)){
    return 'please enter at least a uppercase';
  }else if(smallCase(value)){
    return 'please enter at least a smallcase';
  }
}

bool specialCharacterfound(String value){
  bool found = true;
  for(int i = 0 ; i < value.length ; i++){
    if(value[i] == '!' || value[i] == '@' || value[i] == '#' || value[i] == '%' || value[i] == '^'|| value[i] == '&'|| value[i] == '*'|| value[i] == '('|| value[i] == ')'|| value[i] == '-'|| value[i] == '_'|| value[i] == '+' || value[i] == '=' || value[i] == '~' || value[i] == '`' || value[i] == ':' || value[i] == ';' || value[i] == '"' || value[i] == "'" ||  value[i] == '<' || value[i] == '>' || value[i] == '?' || value[i] == '/' || value[i] == ','  ){
      found = false;
      break;
    }
  }
  return found;
}

bool upperCase(String value){
  bool found = true;
  for(int i = 0 ; i < value.length ; i++){
    if(isUppercase(value[i]) ){
      found = false;
    }
  }
  return found;

  }


bool smallCase(String value){
  bool found = true;
  for(int i = 0 ; i < value.length ; i++){
    if(isLowercase(value[i])){
      found = false;
    }
  }
  return found;

}



