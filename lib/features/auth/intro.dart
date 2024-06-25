import 'package:find_it/core/routing/routes.dart';
import 'package:find_it/features/auth/login/ui/login.dart';
import 'package:find_it/features/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';

import '../../core/theming/my_styles.dart';
import '../../core/widgets/mybtn.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/img/logo.png'),
                Column(
                  children: [
                    MyBtn(
                      inside: false,
                        onTap: (){Navigator.pushReplacementNamed(context, Routes.loginScreen);},
                        myChild: Text('login',style: MyStyles.font18w500,)),
                    MyBtn(
                        inside: false,
                        onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                    }, myChild: Text('Create new User',style: MyStyles.font18w500,))
                  ],
                )
              ],

      ),
    );
  }
}
