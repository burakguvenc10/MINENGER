import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Component/Pageview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
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
  bool isLoaded = false;
  bool selected_ShibaIcon = false;
  bool selected_BttcIcon = false;
  bool selected_FlokiIcon = false;
  bool selected_CateIcon = false;
  bool selected_SatoshiIcon = false;
  bool selected_BabyDogeIcon = false;
  int pageIndex = 0;
  late BannerAd bannerAd;
  Color ShibaCardColor = Colors.grey.shade300;
  Color BttcCardColor = Colors.grey.shade300;
  Color FlokiCardColor = Colors.grey.shade300;
  Color CateCardColor = Colors.grey.shade300;
  Color SatoshiCardColor = Colors.grey.shade300;
  Color BabyDogeCardColor = Colors.grey.shade300;


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
      begin: -10.0,
      end: 10.0,
    ).animate(translateAnimationController)
      ..addListener(() {
        setState(() {});
        debugPrint(translateAnimationController.status.toString());
      });
    translateAnimationController.repeat();
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
                color: Colors.blueGrey.shade200,
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
                      color: Colors.grey.shade300,
                      elevation: 2,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          Row(
                            children:[
                              // Coin Ikonlar
                                  Container(
                                    height: 490,
                                    padding: EdgeInsets.all(1),
                                    child:Column(
                                      children:[
                                        SingleChildScrollView(
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Image.network(
                                                'https://art.ngfiles.com/images/2173000/2173045_supertrekkie92_spinning-coin.gif?f1636079576',width: 35,height: 35,),

                                              CircleAvatar(
                                                backgroundColor: ShibaCardColor,
                                                radius: 35,
                                                child: IconButton(
                                                  tooltip: 'SHIBA',
                                                  splashColor: Colors.orange.shade200,
                                                  isSelected: selected,
                                                  icon:  Image.asset(
                                                    'assets/shiba.png', height: 35, width: 35,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () {
                                                    setState(() {
                                                      if(selected_ShibaIcon == false) {
                                                        selected_ShibaIcon = true;
                                                        ShibaCardColor = button_color;
                                                        BttcCardColor = Colors.transparent;
                                                        FlokiCardColor = Colors.transparent;
                                                        CateCardColor = Colors.transparent;
                                                        SatoshiCardColor = Colors.transparent;
                                                        BabyDogeCardColor = Colors.transparent;
                                                      }else{
                                                        selected_ShibaIcon = false;
                                                        ShibaCardColor = Colors.transparent;
                                                      }
                                                      page_controller.animateToPage(
                                                          0, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                      );
                                                    });

                                                  },
                                                ),
                                              ),


                                              SizedBox(
                                                height: 5,
                                              ),

                                            CircleAvatar(
                                              backgroundColor: BttcCardColor,
                                              radius: 35,
                                              child: IconButton(
                                                tooltip: 'BTTC',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/bttc.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    if(selected_BttcIcon == false) {
                                                      selected_BttcIcon = true;
                                                      BttcCardColor = button_color;
                                                      ShibaCardColor = Colors.transparent;
                                                      FlokiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      BabyDogeCardColor = Colors.transparent;
                                                    }else{
                                                      selected_BttcIcon = false;
                                                      BttcCardColor = Colors.transparent;
                                                    }
                                                    page_controller.animateToPage(
                                                        1, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
                                                },
                                              ),
                                            ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                            CircleAvatar(
                                              backgroundColor: FlokiCardColor,
                                              radius: 35,
                                              child: IconButton(
                                                tooltip: 'FLOKI',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/floki.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    if(selected_FlokiIcon == false) {
                                                      selected_FlokiIcon = true;
                                                      FlokiCardColor = button_color;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      BabyDogeCardColor = Colors.transparent;
                                                    }else{
                                                      selected_FlokiIcon = false;
                                                      FlokiCardColor = Colors.transparent;
                                                    }
                                                    page_controller.animateToPage(
                                                        2, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
                                                },
                                              ),
                                            ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                            CircleAvatar(
                                              backgroundColor: CateCardColor,
                                              radius: 35,
                                              child: IconButton(
                                                tooltip: 'CATE',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/cate.png', height: 40, width: 40,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    if(selected_CateIcon == false) {
                                                      selected_CateIcon = true;
                                                      CateCardColor = button_color;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      BabyDogeCardColor = Colors.transparent;
                                                    }else{
                                                      selected_CateIcon = false;
                                                      CateCardColor = Colors.transparent;
                                                    }
                                                    page_controller.animateToPage(
                                                        3, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
                                                },
                                              ),
                                            ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                            CircleAvatar(
                                              backgroundColor: SatoshiCardColor,
                                              radius: 35,
                                              child: IconButton(
                                                tooltip: 'SATOSHI',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/satoshi.png', height: 35, width: 35,
                                                ),
                                                disabledColor: Colors.grey,
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    if(selected_SatoshiIcon == false) {
                                                      selected_SatoshiIcon = true;
                                                      SatoshiCardColor = button_color;
                                                      CateCardColor = Colors.transparent;;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      BabyDogeCardColor = Colors.transparent;
                                                    }else{
                                                      selected_SatoshiIcon = false;
                                                      SatoshiCardColor = Colors.transparent;
                                                    }
                                                    page_controller.animateToPage(
                                                        4, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
                                                },
                                              ),
                                            ),

                                              SizedBox(
                                                height: 5,
                                              ),

                                            CircleAvatar(
                                              backgroundColor: BabyDogeCardColor,
                                              radius: 35,
                                              child: IconButton(
                                                tooltip: 'BABY DOGE',
                                                splashColor: Colors.orange.shade200,
                                                icon:  Image.asset(
                                                  'assets/babydoge.png', height: 35, width: 35,
                                                ),
                                                iconSize: 50,
                                                onPressed: () {
                                                  setState(() {
                                                    if(selected_BabyDogeIcon == false) {
                                                      selected_BabyDogeIcon = true;
                                                      BabyDogeCardColor = button_color;
                                                      SatoshiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                    }else{
                                                      selected_BabyDogeIcon = false;
                                                      BabyDogeCardColor = Colors.transparent;
                                                    }
                                                    page_controller.animateToPage(
                                                        5, duration: const Duration(microseconds: 300), curve: Curves.easeIn
                                                    );
                                                  });
                                                },
                                              ),
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
    //Animasyon
    initTranslateAnimation();
    translateAnimationController.dispose();
  }
}