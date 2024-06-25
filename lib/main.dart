import 'package:find_it/core/locale/locale.dart';
import 'package:find_it/core/locale/locale_controller.dart';
import 'package:find_it/core/networking/network_controller.dart';
import 'package:find_it/features/chatting/ui/screens/chat_details_screen.dart';
import 'package:find_it/features/chatting/ui/screens/chat_screen.dart';
import 'package:find_it/features/search/ui/screens/search_child_screen.dart';
import 'package:find_it/features/upload/screens/test_mic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/auth/signup/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



late SharedPreferences savey;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  savey = await SharedPreferences.getInstance();
  Get.put(NetworkController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
            locale: controller.intialLocale,
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            initialRoute:  savey.getString('id') == null ? Routes.splashScreen : Routes.bottomNav,
            onGenerateRoute: AppRouter.generateRoute,
            // initialRoute: Routes.loginScreen,
            // home: const ChatScreen(),
            title: 'Find It',
            theme:ThemeData(fontFamily: 'myheboo'),
          );
    }
    );
  }
}

