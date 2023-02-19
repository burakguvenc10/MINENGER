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
                    height: 10,
                  ),
                  Card(
                      color: Colors.blueGrey.shade100,
                      elevation: 5,
                      shadowColor: Colors.black12,
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Text('  Duyuru Text Yazı....',textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15,color: Colors.black,height: 3,),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey.shade200,
                      elevation: 2,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          Pageview(),
                        ],
                      )
                    ),


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