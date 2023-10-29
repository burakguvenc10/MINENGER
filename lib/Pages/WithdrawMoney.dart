import 'dart:io';
import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../Component/Shiba_ParaCekme_Popup.dart';

final Shiba_controller = TextEditingController(text: '0');
final Bttc_controller = TextEditingController(text: '0');
final Floki_controller = TextEditingController(text: '0');
final BabyDoge_controller = TextEditingController(text: '0');
final Satoshi_controller = TextEditingController(text: '0');
final FlightClup_controller = TextEditingController(text: '0');
const button_color = Color.fromRGBO(235, 189, 94 ,1);


class ParaCekme extends StatefulWidget {
  @override
  _ParaCekme createState() => _ParaCekme();
}

class _ParaCekme extends State<ParaCekme> {
  bool isbannerLoaded = false;
  bool isinterstitialLoaded = false;
  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;
  late RewardedAd rewardedAd;
  late double sonuc;

  loadBannerAd(){
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/6300978111" : "ca-app-pub-3940256099942544/6300978111", //testId
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isbannerLoaded = true;
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

  loadRewardedAd(){
    RewardedAd.load(
        adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/5224354917" : "ca-app-pub-3940256099942544/5224354917", //testID
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              rewardedAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error){
              rewardedAd = error as RewardedAd;
            })
    );
  }

  showRewardedAdd(){
    if(rewardedAd != null){
      rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedAd ad){

          },
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){
            ad.dispose();
            loadRewardedAd();
          },
          onAdDismissedFullScreenContent: (ad){
            ad.dispose();
            loadRewardedAd();
          }
      );
      rewardedAd.setImmersiveMode(true);
      rewardedAd.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem){
            showAnimatedDialog(
              alignment: Alignment.center,
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return ClassicGeneralDialogWidget(
                  actions: [
                    Dialog_Detail(),
                  ],
                  onPositiveClick: () {
                  },
                  onNegativeClick: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              animationType: DialogTransitionType.size,
              curve: Curves.easeInBack,
              duration: Duration(seconds: 1),
            );
          }
      );
    }
  }

  /*loadInterstitialAd(){
    InterstitialAd.load(
        adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/1033173712" : "ca-app-pub-3940256099942544/1033173712", //testId
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              setState(() {
                isinterstitialLoaded = true;
              });
              if(interstitialAd != null){
                interstitialAd.show();
              }
            },
            onAdFailedToLoad: (LoadAdError) {
              interstitialAd.dispose();
            },
        ),
    );
  }*/


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
                  Container(
                      height: 520,
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
                      padding: const EdgeInsets.all(20.0),
                      child:SingleChildScrollView(
                        child: Column(
                        children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Shiba_controller,
                                    decoration: InputDecoration(
                                      labelText: 'SHIBA',
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/shiba.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'PARA ÇEK',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Akrobat-Regular',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: button_color,
                                  enabled: true,
                                  duration: 30,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                    var Shiba = Shiba_controller.value.text;
                                    int Shiba_value = int.parse(Shiba);
                                    print("Shiba_value: " + '$Shiba_value');
                                    if(Shiba_value < 1000){
                                      Dialogs.materialDialog(
                                          color: Colors.white,
                                          msg: 'UYARI MESAJI!',
                                          context: context,
                                          actions: [
                                            IconsButton(
                                              onPressed: () {
                                              },
                                              text: 'Shiba sayısı 1000 den büyük olmalıdır!',
                                              iconData: Iconsax.warning_2,
                                              color: Colors.red,
                                              textStyle: TextStyle(color: Colors.white),
                                              iconColor: Colors.white,
                                            ),
                                      ]);
                                    }
                                    else{
                                      //RewardedAd
                                      showRewardedAdd();
                                    }
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),


                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Bttc_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/bttc.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'BTTC',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '30 GünSonra',
                                          style: TextStyle(
                                            fontSize: 17,
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
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Floki_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/floki.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'FLOKI',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Yakında',
                                          style: TextStyle(
                                            fontSize: 17,
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: BabyDoge_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/babydoge.png',width: 48,height: 48,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'BABY DOGE',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Yakında',
                                          style: TextStyle(
                                            fontSize: 17,
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Satoshi_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/satoshi.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'SATOSHI',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Yakında',
                                          style: TextStyle(
                                            fontSize: 17,
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: false,
                                    style: TextStyle(fontSize: 18),
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: FlightClup_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/flightclup.jpeg',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'FLIGHT CLUP',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      errorStyle: TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    onSaved: (deger) {
                                    },
                                    onChanged: (deger) {
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Yakında',
                                          style: TextStyle(
                                            fontSize: 17,
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),

                    SizedBox(
                      height: 10,
                    ),

                    //BANNER-ADMOB
                      isbannerLoaded?SizedBox(
                      height: bannerAd.size.height.toDouble(),
                      width: bannerAd.size.width.toDouble(),
                      child: AdWidget(ad: bannerAd,),
                    )
                      :const SizedBox(),
                  ],
          )
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    //Admob-Banner
    loadBannerAd();
    loadRewardedAd();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    rewardedAd.dispose();
    //loadInterstitialAd();
  }
}

