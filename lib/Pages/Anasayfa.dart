import 'package:flutter/material.dart';
import '../Component/Pageview.dart';

class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Duyuru Text Yazı....')
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                child: Column(
                  children: [
                    Pageview(),


                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );

  }
}