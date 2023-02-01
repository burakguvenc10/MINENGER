import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:minenger/main.dart';
import 'package:flutter/material.dart';

class Animated_splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.white,
          fontFamily: 'Akrobat-Semibold',
        ),
        home: AnimatedSplashScreen(
            duration: 900,
            splash: Stack(
                children:[
                Image.asset('assets/coin.jpg',fit: BoxFit.contain),

                ],
            ), nextScreen: MyHomePage(),
            splashTransition: SplashTransition.sizeTransition,
            //pageTransitionType: PageTransitionType.scale,
            //backgroundColor: Colors.white
        ),
    );
  }
}
