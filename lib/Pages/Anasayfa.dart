import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/animation/pulse_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:easy_animate/enum/animate_type.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:hive_flutter/adapters.dart';
import '../Component/Pageview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:convert';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
const acik_turuncu = Color.fromRGBO(239, 159, 56 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);
const siyah = Color.fromRGBO(40, 40, 48 ,1);
const gri = Color.fromRGBO(122, 159, 191 ,1);
const pembe = Color.fromRGBO(240, 194, 194 ,1);
const acikmavi = Color.fromRGBO(61,142,185,1);
const mavi = Color.fromRGBO(44,130,201 ,1);
int stateCont = 0;
num _curr = 0;
bool selected = true;
int toplamIndex = 0 ;
int shibaIndex = 0;
int bttcIndex = 1;
int flokiIndex = 2;
int cateIndex = 3;
int satoshiIndex = 4;
int flightClubIndex = 5;

var shiba_data = "Yükleniyor..";
var bttc_data = "Yükleniyor..";
var floki_data = "Yükleniyor..";
var cate_data = "Yükleniyor..";
var satoshi_data = "Yükleniyor..";
var fightclub_data = "Yükleniyor..";


class Anasayfa extends StatefulWidget {
  @override
  _Anasayfa createState() => _Anasayfa();
}

class _Anasayfa extends State<Anasayfa> with TickerProviderStateMixin {
  late FlutterGifController controller1 = FlutterGifController(vsync: this);
  late AnimationController translateAnimationController;
  late Animation<double> translateAnimation;
  bool isLoaded = false;
  bool selected_ShibaIcon = false;
  bool selected_BttcIcon = false;
  bool selected_FlokiIcon = false;
  bool selected_CateIcon = false;
  bool selected_SatoshiIcon = false;
  bool selected_FightclubIcon = false;
  late BannerAd bannerAd;
  Color ShibaCardColor = Colors.grey.shade300;
  Color BttcCardColor = Colors.grey.shade300;
  Color FlokiCardColor = Colors.grey.shade300;
  Color CateCardColor = Colors.grey.shade300;
  Color SatoshiCardColor = Colors.grey.shade300;
  Color FLightClupCardColor = Colors.grey.shade300;
  var jsonList = [];
  var price = "";
  late Response response;
  String baseUrl = "";//https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest
  String headers_key = 'X-CMC_PRO_API_KEY';
  String headers_value = 'e6d3b04a-1e8f-4cbd-a2c4-a8aa84c0035f';
  String headers_aut = 'Authorization';
  String shiba_id = "5994";
  String bttc_id = "3718";
  String floki_id = "10804";
  String cate_id = "9656";
  String satoshi_id = "9022";
  String flightClup_id = "22550";
  Dio dio = Dio();


  Future getShibaData() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
          queryParameters: {
              'id': shiba_id
          },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          shiba_data = price.substring(744,754);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

  }

  Future getBttcData() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
        queryParameters: {
          'id': bttc_id
        },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          bttc_data = price.substring(696,706);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

  }

  Future getFlokiData() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
        queryParameters: {
          'id': floki_id
        },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          floki_data = price.substring(812,822);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

  }

  Future getCateData() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
        queryParameters: {
          'id': cate_id
        },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          cate_data = "0.00..." + price.substring(840,846);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

  }

  Future getSatoshiData() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
        queryParameters: {
          'id': satoshi_id
        },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          satoshi_data = price.substring(555,565);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

  }

  Future getFlightClub() async {
    try {
      dio.options.headers[headers_key] = headers_value;
      dio.options.headers[headers_aut] = headers_value;
      response = await dio.get(baseUrl,
        queryParameters: {
          'id': flightClup_id
        },
      );
      if (response.statusCode == 200) {
        price = response.data.toString();
        print("Response_Data : ${price}");

        setState(() {
          fightclub_data = price.substring(718,728);
        });

      }else{
        print("Response Hata Kodu! : ${response.statusCode}");
      }

    } on DioError catch(e){
      print("Response Hata Aldi! : ${e}");
      return Future.error(e.message as Object);
    }

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

                      //Canlı Kur Oranları Flips
                      FadeInAnimation(
                        animateDirection: AnimateDirection.right,
                        animateType: AnimateType.once,
                        durationMilliseconds: 2000,
                        moveAmount: 400,
                        child: Row(
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                height: 39,
                                              ),

                                              SizedBox(height: 1,),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/dolar.png",
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
                                                height: 39,
                                              ),

                                              SizedBox(height: 1,),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                                    "assets/dolar.png",
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
                                      color: acikmavi.withOpacity(0.8),
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
                                          getFlightClub();
                                        },
                                        front: Container(
                                          child: Column(
                                            children:[
                                              Image.asset(
                                                "assets/flightclup.jpeg",
                                                height: 35,
                                              ),

                                              SizedBox(height: 1,),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/dolar.png",
                                                    height: 30,
                                                    width: 28,
                                                  ),

                                                  Text(fightclub_data,style: TextStyle(fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        back: Container(
                                          child: Column(
                                            children:[
                                              Image.asset(
                                                "assets/flightclup.jpeg",
                                                height: 35,
                                              ),

                                              SizedBox(height: 1,),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/dolar.png",
                                                    height: 30,
                                                    width: 28,
                                                  ),

                                                  Text(fightclub_data,style: TextStyle(fontSize: 16)),
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
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Coin Ikonlar
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

                                            Container(
                                              height: 35,
                                              width: 35,
                                              //child: GifImage(
                                                //controller: controller1,
                                                //image: const AssetImage("assets/gif/coin.gif"),
                                                child:Image.network(
                                                  'https://art.ngfiles.com/images/2173000/2173045_supertrekkie92_spinning-coin.gif?f1636079576'
                                                //),
                                              ),
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
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
                                                  onPressed: () async {
                                                    setState(() {
                                                      selected_ShibaIcon = true;
                                                      ShibaCardColor = turuncu;
                                                      BttcCardColor = Colors.transparent;
                                                      FlokiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      FLightClupCardColor = Colors.transparent;
                                                      toplamIndex = shibaIndex;
                                                      page_controller.animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),


                                            SizedBox(
                                              height: 5,
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
                                                backgroundColor: BttcCardColor,
                                                radius: 35,
                                                child: IconButton(
                                                  tooltip: 'BTTC',
                                                  splashColor: Colors.orange.shade200,
                                                  icon:  Image.asset(
                                                    'assets/bttc.png', height: 35, width: 35,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () async{
                                                    setState(() {
                                                      selected_BttcIcon = true;
                                                      BttcCardColor = siyah;
                                                      ShibaCardColor = Colors.transparent;
                                                      FlokiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      FLightClupCardColor = Colors.transparent;
                                                      toplamIndex = bttcIndex;
                                                      page_controller.animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                           ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
                                                backgroundColor: FlokiCardColor,
                                                radius: 35,
                                                child: IconButton(
                                                  tooltip: 'FLOKI',
                                                  splashColor: Colors.orange.shade200,
                                                  icon:  Image.asset(
                                                    'assets/floki.png', height: 35, width: 35,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () async{
                                                    setState(() {
                                                      selected_FlokiIcon = true;
                                                      FlokiCardColor = gri;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      FLightClupCardColor = Colors.transparent;
                                                      toplamIndex = flokiIndex;
                                                      page_controller.animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                           ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
                                                backgroundColor: CateCardColor,
                                                radius: 35,
                                                child: IconButton(
                                                  tooltip: 'CATE',
                                                  splashColor: Colors.orange.shade200,
                                                  icon:  Image.asset(
                                                    'assets/cate.png', height: 40, width: 40,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () async{
                                                    setState(() {
                                                      selected_CateIcon = true;
                                                      CateCardColor = pembe;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      SatoshiCardColor = Colors.transparent;
                                                      FLightClupCardColor = Colors.transparent;
                                                      toplamIndex = cateIndex;
                                                      page_controller. animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
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
                                                  onPressed: () async{
                                                    setState(() {
                                                      selected_SatoshiIcon = true;
                                                      SatoshiCardColor = acik_turuncu;
                                                      CateCardColor = Colors.transparent;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      FLightClupCardColor = Colors.transparent;
                                                      toplamIndex = satoshiIndex;
                                                      page_controller.animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                           ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            PulseAnimation(
                                              animateType: AnimateType.loop,
                                              durationMilliseconds: 2100,
                                              child: CircleAvatar(
                                                backgroundColor: FLightClupCardColor,
                                                radius: 35,
                                                child: IconButton(
                                                  tooltip: 'FLIGHT CLUP',
                                                  splashColor: mavi,
                                                  icon:  Image.asset(
                                                    "assets/flightclup.jpeg", height: 35, width: 35,
                                                  ),
                                                  iconSize: 50,
                                                  onPressed: () async{
                                                    setState(() {
                                                      selected_FightclubIcon = true;
                                                      FLightClupCardColor = mavi;
                                                      SatoshiCardColor = Colors.transparent;
                                                      CateCardColor = Colors.transparent;;
                                                      FlokiCardColor = Colors.transparent;
                                                      BttcCardColor = Colors.transparent;
                                                      ShibaCardColor = Colors.transparent;
                                                      toplamIndex = flightClubIndex;
                                                      page_controller.animateToPage(
                                                          toplamIndex, duration: const Duration(seconds: 1), curve: Curves.easeIn
                                                      );
                                                    });
                                                  },
                                                ),
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
                                      Pageview(toplamIndex),
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
    setState(() {
      selected_ShibaIcon = true;
      ShibaCardColor = turuncu;
      BttcCardColor = Colors.transparent;
      FlokiCardColor = Colors.transparent;
      CateCardColor = Colors.transparent;
      SatoshiCardColor = Colors.transparent;
      FLightClupCardColor = Colors.transparent;
    });
    //Admob-Banner
    loadBannerAd();
    //Animasyon-DuyuruText
    initTranslateAnimation();
    //Exchange-Coins
    getShibaData();
    getBttcData();
    getFlokiData();
    getCateData();
    getSatoshiData();
    getFlightClub();
    //Gif
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 53,
        period: const Duration(milliseconds: 2500),
      );
    });

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
    //Exchange-Coin
    getShibaData();
    getBttcData();
    getFlokiData();
    getCateData();
    getSatoshiData();
    getFlightClub();
  }


}