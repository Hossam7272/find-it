import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), (){
      myTurns = 1;
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 3), (){
      myScale = 0;
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 7), (){
      Navigator.pushReplacementNamed(context, Routes.intro);
    });




  }
  double myTurns = 0;
  double myScale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedRotation(
        turns: myTurns ,
        duration: const Duration(seconds: 2),
        child: Center(
          child: AnimatedScale(
              scale: myScale ,
              duration:  const Duration(seconds: 4),
              child: Image.asset('assets/img/logo.png')
          ),
        ),
      ),

    );
  }
}
