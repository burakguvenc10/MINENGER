import 'dart:io';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:csslib/parser.dart' as parser;
import '../Component/Pageview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
const acik_turuncu = Color.fromRGBO(239, 159, 56 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);
const siyah = Color.fromRGBO(40, 40, 48 ,1);
const gri = Color.fromRGBO(122, 159, 191 ,1);
const pembe = Color.fromRGBO(240, 194, 194 ,1);
num _curr = 0;
bool selected = true;
int pageIndex = 0;
var shiba_data = "Yükleniyor..";
var bttc_data = "Yükleniyor..";
var floki_data = "Yükleniyor..";
var cate_data = "Yükleniyor..";
var satoshi_data = "Yükleniyor..";
var babydoge_data = "Yükleniyor..";


class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> with TickerProviderStateMixin  {
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


  Future getShibaData() async {
    //Parse-CoinsValue
    var Shiba_Url = Uri.parse(
        "https://www.binance.com/en/price/shiba-inu");

    var resShiba = await http.get(Shiba_Url);
    dom.Document htmlShiba = dom.Document.html(resShiba.body);
    final Shiba_titles = htmlShiba
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      shiba_data = Shiba_titles;
    });

  }

  Future getBttcData() async {
    //Parse-CoinsValue
    var Bttc_Url = Uri.parse(
        "https://www.binance.com/en/price/bittorrent-new");

    var resBttc = await http.get(Bttc_Url);
    dom.Document htmlBttc = dom.Document.html(resBttc.body);
    final Bttc_titles = htmlBttc
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      bttc_data = Bttc_titles;
    });

  }

  Future getFlokiData() async {
    //Parse-CoinsValue
    var Floki_Url = Uri.parse(
        "https://www.binance.com/en/price/floki-inu");

    var resFloki = await http.get(Floki_Url);
    dom.Document htmlFloki = dom.Document.html(resFloki.body);
    final Floki_titles = htmlFloki
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      floki_data = Floki_titles;
    });

  }

  Future getCateData() async {
    //Parse-CoinsValue
    var Cate_Url = Uri.parse(
        "https://www.binance.com/en/price/catecoin");

    var resCate = await http.get(Cate_Url);
    dom.Document htmlCate = dom.Document.html(resCate.body);
    final Cate_titles = htmlCate
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      cate_data = Cate_titles;
    });

  }

  Future getSatoshiData() async {
    //Parse-CoinsValue
    var Satoshi_Url = Uri.parse(
        "https://www.binance.com/en/price/satoshi");

    var resSatoshi = await http.get(Satoshi_Url);
    dom.Document htmlSatoshi= dom.Document.html(resSatoshi.body);
    final Satoshi_titles = htmlSatoshi
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      satoshi_data = Satoshi_titles;
    });

  }

  Future getBabyDogeData() async {
    //Parse-CoinsValue
    var BabyDoge_Url = Uri.parse(
        "https://www.binance.com/en/price/baby-doge-coin");

    var resBabydoge = await http.get(BabyDoge_Url);
    dom.Document htmlBaby= dom.Document.html(resBabydoge.body);
    final Babydoge_titles = htmlBaby
        .querySelectorAll(
        '#__APP > div > main > section > div > div.css-871wnf > div.css-1wh66rn > div.css-1267ixm > div.css-1bwgsh3')
        .map((element) => element.innerHtml.substring(1).trim()).toString();

    setState(() {
      babydoge_data = Babydoge_titles;
    });

  }


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
                height: 10,
              ),

              Text(
                "Canlı Kur Oranları",
                style: TextStyle(color: Colors.grey.shade400),
              ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120 ,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: turuncu.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                            FlipCard(
                              direction: FlipDirection.VERTICAL,
                              side: CardSide.BACK,
                              speed: 1000,
                              onFlipDone: (status) {
                                getShibaData();
                              },
                              front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/shiba.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(shiba_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                              ),
                            back: Container(
                              child: Column(
                                children:[
                                  Image.asset(
                                    "assets/shiba.png",
                                    height: 35,
                                  ),

                                  SizedBox(height: 1,),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/tl.png",
                                        height: 30,
                                        width: 28,
                                      ),

                                      Text(shiba_data,style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                             ),
                            ),
                          ],
                        ),
                       ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: siyah.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlipCard(
                                direction: FlipDirection.VERTICAL,
                                side: CardSide.BACK,
                                speed: 1000,
                                onFlipDone: (status) {
                                  getBttcData();
                                },
                                front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/bttc.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(bttc_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                back: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/bttc.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(bttc_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: gri.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlipCard(
                                direction: FlipDirection.VERTICAL,
                                side: CardSide.BACK,
                                speed: 1000,
                                onFlipDone: (status) {
                                  getFlokiData();
                                },
                                front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/floki.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(floki_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                back: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/floki.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(floki_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: pembe.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlipCard(
                                direction: FlipDirection.VERTICAL,
                                side: CardSide.BACK,
                                speed: 1000,
                                onFlipDone: (status) {
                                  getCateData();
                                },
                                front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/cate.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(cate_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                back: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/cate.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(cate_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: turuncu.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlipCard(
                                direction: FlipDirection.VERTICAL,
                                side: CardSide.BACK,
                                speed: 1000,
                                onFlipDone: (status) {
                                  getSatoshiData();
                                },
                                front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/satoshi.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(satoshi_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                back: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/satoshi.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(satoshi_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: button_color.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlipCard(
                                direction: FlipDirection.VERTICAL,
                                side: CardSide.BACK,
                                speed: 1000,
                                onFlipDone: (status) {
                                  getBabyDogeData();
                                },
                                front: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/babydoge.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(babydoge_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                back: Container(
                                  child: Column(
                                    children:[
                                      Image.asset(
                                        "assets/babydoge.png",
                                        height: 35,
                                      ),

                                      SizedBox(height: 1,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/tl.png",
                                            height: 30,
                                            width: 28,
                                          ),

                                          Text(babydoge_data,style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0,3),
                          ),
                        ],
                      ),
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

                                                    page_controller. animateToPage(
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
    getShibaData();
    getBttcData();
    getFlokiData();
    getCateData();
    getSatoshiData();
    getBabyDogeData();

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
    //Animasyon
    initTranslateAnimation();
    translateAnimationController.dispose();
    getShibaData();
    getBttcData();
    getFlokiData();
    getCateData();
    getSatoshiData();
    getBabyDogeData();
  }
}