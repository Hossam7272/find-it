import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar"  : {
      'home'          : 'الرئيسية',
      'child'         : 'الأبناء المفقودين',
      'upload'        : 'رفع البيانات',
      'upload_items'  : 'رفع منتجات',
      'upload_child'  : 'رفع أطفال',
      'edit_profile'  : 'تعديل الملف الشخصي' ,
      'logout'        : 'تسجيل خروج',
      'change_pass'   : 'تغير كلمة المرور',
      'Lan'           : 'اللغة',
      'regional'      : 'المنطقة',
      'search'        : 'البحث',
      'login'         : 'تسجل دخول',
      'forget'        : 'نسيت كلمة المرور',
      'username'      : 'اسم المستخدم',
      'password'      : 'كلمة المرور',
      'entermail'     : 'أدخل البريد الاليكتروني',
      'enterpass'     : 'أدخل كلمة المرور',
      'message'       : 'إرسل رسالة',
      'messages'      : 'الرسائل'




    },
    "en"  : {
      'home'          : 'home',
      'child'         : 'Lost Children',
      'upload'        : 'Upload',
      'upload_items'  : 'upload items',
      'upload_child'  : 'upload child',
      'edit_profile'  : 'Edit Profile',
      'logout'        : 'Logout',
      'change_pass'   : 'Change Password',
      'Lan'           : 'Language',
      'regional'      : 'Regional',
      'search'        : 'search',
      'login'         : 'Login',
      'forget'        : 'forget password',
      'username'      : 'username',
      'password'      : 'password',
      'entermail'     : 'Please enter your email',
      'enterpass'     : 'Please enter your password',
      'message'       : 'send message',
      'messages'      : 'Messages'





    }
  };

}