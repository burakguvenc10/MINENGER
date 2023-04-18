import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Component/Pageview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

num _curr = 0;
bool selected = true;

class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> with TickerProviderStateMixin  {
  final PageController pageviewController = PageController(initialPage: 0);
  late AnimationController translateAnimationController;
  late Animation<double> translateAnimation;
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  bool _icon = false;
  bool isLoaded = false;
  int pageIndex = 0;
  late BannerAd bannerAd;


  loadBannerAd(){
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/6300978111" : "ca-app-pub-3940256099942544/6300978111", //testId
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();
          }
        ),
        request: const AdRequest(),
    );
    bannerAd.load();
  }

  initTranslateAnimation() {
    translateAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 13
      ),
    );
      translateAnimation = Tween(
      begin: -18.0,
      end: 30.0,
    ).animate(translateAnimationController)
      ..addListener(() {
        setState(() {});
        debugPrint(translateAnimationController.status.toString());
      });
    translateAnimationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                      Transform.translate(
                          offset: Offset(
                              translateAnimation.value * -10.0, 0.0
                          ),
                            child: SizedBox(
                              child:Row(
                                children:[
                                   Padding(padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Son Dakika Duyurular....',textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 17,color: Colors.black,height: 2,
                                      ),
                                      maxLines: 1,
                                    ),
                                   ),
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
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

                    SizedBox(
                      height: 10,
                    ),

                   //BANNER-ADMOB
                   isLoaded?SizedBox(
                     height: bannerAd.size.height.toDouble(),
                     width: bannerAd.size.width.toDouble(),
                     child: AdWidget(ad: bannerAd,),
                   )
                    :const SizedBox(),
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
    //Admob-Banner
    loadBannerAd();
    //Animasyon-DuyuruText
    initTranslateAnimation();

    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
  }

  @override
  void dispose() {
    //Admob-Banner
    bannerAd.dispose();
    loadBannerAd();
    //Viewpager
    pageviewController.dispose();
    initTranslateAnimation();
  }
}