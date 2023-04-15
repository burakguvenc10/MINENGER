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
  bool _icon = false;

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
                    height: 20,
                  ),

                  Card(
                      color: Colors.blueGrey.shade100,
                      elevation: 5,
                      shadowColor: Colors.black12,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('  Son Dakika Duyurular....',textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,color: Colors.black,height: 3,
                              ),
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
                                  Container(
                                    height: 470,
                                    padding: EdgeInsets.all(1),
                                    child:Column(
                                      children:[
                                        SingleChildScrollView(
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Image.network(
                                                'https://art.ngfiles.com/images/2173000/2173045_supertrekkie92_spinning-coin.gif?f1636079576',width: 35,height: 35,),

                                              IconButton(
                                                tooltip: 'SHIBA',
                                                splashColor: Colors.orange.shade200,
                                                isSelected: selected,
                                                icon:  Image.asset(
                                                  'assets/shiba.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    _icon = !_icon;
                                                    page_controller.animateToPage(
                                                        0, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });

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
                                                  setState(() {
                                                    page_controller.animateToPage(
                                                        1, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
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
                                                  setState(() {
                                                    page_controller.animateToPage(
                                                        2, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
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
                                                  setState(() {
                                                    page_controller.animateToPage(
                                                        3, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
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
                                                  setState(() {
                                                    page_controller.animateToPage(
                                                        4, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
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
                                                  setState(() {
                                                    page_controller.animateToPage(
                                                        5, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
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
                                    width: 280,
                                    alignment: Alignment.center,
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
                    ),
                  ],
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