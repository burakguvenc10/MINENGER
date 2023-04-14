import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Component/Pageview.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Floki.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/Cate.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/BabyDoge.dart';

num _curr = 0;
bool selected = true;

class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> {
  int pageIndex = 0;
  final PageController pageviewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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

              Column(
                  children: [
                    Card(
                      color: Colors.grey.shade200,
                      elevation: 2,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          Row(
                            children:[
                              // Coin Ikonlar
                                Stack(
                                children: [
                                  Container(
                                    height: 450,
                                    alignment: Alignment.center,
                                    child:Column(
                                      children:[
                                        SingleChildScrollView(
                                          child:Column(
                                            children: [
                                              IconButton(
                                                tooltip: 'SHIBA',
                                                splashColor: Colors.orange.shade200,
                                                isSelected: selected,
                                                icon:  Image.asset(
                                                  'assets/shiba.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(1);
                                                },
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              IconButton(
                                                tooltip: 'BTTC',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/bttc.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(2);
                                                },
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              IconButton(
                                                tooltip: 'FLOKI',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/floki.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(3);
                                                },
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              IconButton(
                                                tooltip: 'SATOSHI',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/satoshi.png', height: 35, width: 35,
                                                ),
                                                disabledColor: Colors.grey,
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(4);
                                                },
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              IconButton(
                                                tooltip: 'CATE',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/cate.png', height: 40, width: 40,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(5);
                                                },
                                              ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                              IconButton(
                                                tooltip: 'BABY DOGE',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/babydoge.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  gotoSelectedPage(6);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 450,
                                    margin: EdgeInsets.only(left: 70),
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      children: [
                                        Pageview(pageIndex),
                                      ],
                                    ),
                                  ),

                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  gotoSelectedPage(int selectedPage) {
    pageviewController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn);
  }

  final List<Widget> _list = <Widget>[
    Center(
        child: Shiba()),
    Center(
        child: Bttc()),
    Center(
        child: Floki()),
    Center(
        child: Cate()),
    Center(
        child: Satoshi()),
    Center(
        child: BabyDoge()),

  ];

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