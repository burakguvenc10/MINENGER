import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:minenger/Pages/Splash.dart';
import 'package:flutter/material.dart';

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
            duration: 30,
            splash: Stack(
                children:[
                Image.asset('assets/msplash.png',fit: BoxFit.contain,color: Colors.white,height: 130,width: 200,),

                ],
            ), nextScreen: FirstPage(),
            splashTransition: SplashTransition.scaleTransition,
            //pageTransitionType: PageTransitionType.scale,
            //backgroundColor: Colors.white
        ),
    );
  }

  @override
  void initState(){
    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
  }
}
