import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minenger/Pages/Login.dart';
import 'package:minenger/Pages/Signup.dart';
import 'package:minenger/main.dart';
import 'package:animated_button/animated_button.dart';

const button_color = Color.fromRGBO(252, 185, 65 ,1);

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/kurdele.png',fit: BoxFit.contain,height: 80,width: 260),

              Text("MINENGER",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),

              SizedBox(
                height: 40,
              ),

              Image.asset('assets/money.png',fit: BoxFit.contain,height: 55,width: 130, alignment:Alignment.center),

              Image.asset('assets/miner.png',fit: BoxFit.contain,height: 120,width: 200),

              SizedBox(
                height: 20,
              ),

              AnimatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Akrobat-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
                color: button_color,
                duration: 25,
                shadowDegree: ShadowDegree.dark,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
                },
              ),

              SizedBox(
                height: 20,
              ),

              AnimatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'KAYIT OL',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Akrobat-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
                color: button_color,
                duration: 25,
                shadowDegree: ShadowDegree.dark,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Signup()));
                },
              ),

              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
  }
}