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
            duration: 1100,
            splash: Stack(
                children:[
                Image.asset('assets/coin.jpeg',fit: BoxFit.contain, width: 150, alignment: Alignment.center),
                  SizedBox(
                    height: 20,
                  ),
                //Image.asset('assets/tozemis.png',fit: BoxFit.contain, color: Colors.white,width: 151, height: 140,alignment: Alignment.center),
                ],
            ), nextScreen: MyHomePage(),
            splashTransition: SplashTransition.sizeTransition,
            //pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white
        ),
    );
  }
}
