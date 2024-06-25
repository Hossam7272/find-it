import 'package:find_it/core/routing/routes.dart';
import 'package:find_it/core/widgets/bottom_bar.dart';
import 'package:find_it/features/auth/intro.dart';
import 'package:find_it/features/auth/login/ui/login.dart';
import 'package:find_it/features/card/ui/myCart.dart';
import 'package:find_it/features/home/ui/home.dart';
import 'package:find_it/features/details/item_details.dart';
import 'package:find_it/features/profile/edit_profile/edit_profile.dart';
import 'package:find_it/features/profile/ui/profile.dart';
import 'package:find_it/features/profile/ui/qr_code.dart';
import 'package:find_it/features/search/ui/screens/search_child_screen.dart';
import 'package:find_it/features/search/ui/screens/search_items.dart';
import 'package:find_it/features/settings/ui/setting.dart';
import 'package:find_it/features/splash/splash_screen.dart';
import 'package:find_it/features/upload/screens/upload.dart';
import 'package:find_it/features/upload/screens/upload_children.dart';
import 'package:find_it/features/upload/screens/upload_items.dart';
import 'package:flutter/material.dart';
import '../../features/lost_children/ui/screens/lost_children_screen.dart';


class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(
          builder: (_) => const Intro(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const Login()
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const Home()
        );
      case Routes.uploadScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadScreen()
        );
      case Routes.uploadItemsScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadItemsScreen()
        );
      case Routes.uploadChildrenScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadChildrenScreen()
        );
      case Routes.lostChildrenScreen:
        return MaterialPageRoute(
            builder: (_) => const LostChildrenScreen()
        );
      case Routes.itemsDetailsScreen:
        var item = settings.arguments ;
        return MaterialPageRoute(
            builder: (_) =>  ItemDetails(item: item,)
        );
      case Routes.searchItemScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchItemScreen()
        );
      case Routes.searchChildScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchChildScreen()
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen()
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
            builder: (_) =>  MyCart()
        );
      case Routes.qrCodeScreen:
        return MaterialPageRoute(
            builder: (_) =>  const QrCode()
        );
      case Routes.bottomNav:
        return MaterialPageRoute(
            builder: (_) =>  const BottomBar()
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
            builder: (_) =>   const EditProfile()
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
            builder: (_) =>    Setting()
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) =>  const SplashScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}