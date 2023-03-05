import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:minenger/main.dart';
import 'package:flutter/material.dart';
import '../Pages/Login.dart';

class Animated_splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Akrobat-Semibold',
        ),
        home: AnimatedSplashScreen(
           backgroundColor: Colors.orange.shade200,
            duration: 900,
            splash: Stack(
                children:[
                Image.asset('assets/msplash.png',fit: BoxFit.contain,color: Colors.white,),

                ],
            ), nextScreen: Login(),
            splashTransition: SplashTransition.sizeTransition,
            //pageTransitionType: PageTransitionType.scale,
            //backgroundColor: Colors.white
        ),
    );
  }
}
