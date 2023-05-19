import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minenger/Viewpager_Pages/BabyDoge.dart';
import '../Component/Pageview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
const acik_turuncu = Color.fromRGBO(239, 159, 56 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);
const siyah = Color.fromRGBO(40, 40, 48 ,1);
const gri = Color.fromRGBO(66, 77, 78 ,1);
const pembe = Color.fromRGBO(240, 194, 194 ,1);
num _curr = 0;
bool selected = true;
int pageIndex = 0;

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

              Text(
                  "Kur Oranları",
                  style: TextStyle(color: Colors.grey.shade400),
              ),

              Card(
                color: Colors.blueGrey.shade200,
                elevation: 5,
                shadowColor: Colors.black12,
                child: Container(
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Transform.translate(
                          offset: Offset(
                              translateAnimation.value * -28.0, 0.0
                          ),
                            child: SizedBox(
                                child:Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset('assets/shiba.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                      SizedBox(width: 30,),

                                      Column(
                                        children: [
                                          Image.asset('assets/bttc.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                      SizedBox(width: 30,),

                                      Column(
                                        children: [
                                          Image.asset('assets/floki.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                      SizedBox(width: 30,),

                                      Column(
                                        children: [
                                          Image.asset('assets/cate.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                      SizedBox(width: 30,),

                                      Column(
                                        children: [
                                          Image.asset('assets/satoshi.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                      SizedBox(width: 30,),

                                      Column(
                                        children: [
                                          Image.asset('assets/babydoge.png',width: 30,height: 30,),
                                          Text("10.0",style: TextStyle(fontSize: 16)),
                                        ],
                                      ),

                                    ],
                                  ),
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
                                                  splashColor:turuncu,
                                                  isSelected: selected,
                                                  icon:  Image.asset(
                                                    'assets/shiba.png', height: 35, width: 35,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () {
                                                    setState(() {
                                                      selected_ShibaIcon = true;
                                                      ShibaCardColor = turuncu;
                                                      BttcCardColor = Colors.transparent;
                                                      FlokiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      BabyDogeCardColor = Colors.transparent;

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
                                                    selected_BttcIcon = true;
                                                    BttcCardColor = siyah;
                                                    ShibaCardColor = Colors.transparent;
                                                    FlokiCardColor = Colors.transparent;
                                                    CateCardColor = Colors.transparent;
                                                    SatoshiCardColor = Colors.transparent;
                                                    BabyDogeCardColor = Colors.transparent;

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
                                                    selected_FlokiIcon = true;
                                                    FlokiCardColor = gri;
                                                    BttcCardColor = Colors.transparent;
                                                    ShibaCardColor = Colors.transparent;
                                                    CateCardColor = Colors.transparent;
                                                    SatoshiCardColor = Colors.transparent;
                                                    BabyDogeCardColor = Colors.transparent;

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
                                                    selected_CateIcon = true;
                                                    CateCardColor = pembe;
                                                    FlokiCardColor = Colors.transparent;
                                                    BttcCardColor = Colors.transparent;
                                                    ShibaCardColor = Colors.transparent;
                                                    SatoshiCardColor = Colors.transparent;
                                                    BabyDogeCardColor = Colors.transparent;

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
                                                    selected_SatoshiIcon = true;
                                                    SatoshiCardColor = acik_turuncu;
                                                    CateCardColor = Colors.transparent;
                                                    FlokiCardColor = Colors.transparent;
                                                    BttcCardColor = Colors.transparent;
                                                    ShibaCardColor = Colors.transparent;
                                                    BabyDogeCardColor = Colors.transparent;
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
                                                    selected_BabyDogeIcon = true;
                                                    BabyDogeCardColor = button_color;
                                                    SatoshiCardColor = Colors.transparent;
                                                    CateCardColor = Colors.transparent;;
                                                    FlokiCardColor = Colors.transparent;
                                                    BttcCardColor = Colors.transparent;
                                                    ShibaCardColor = Colors.transparent;
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