import 'dart:io';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final Shiba_controller = TextEditingController();
final Bttc_controller = TextEditingController();
final Floki_controller = TextEditingController();
final Cate_controller = TextEditingController();
final Satoshi_controller = TextEditingController();
final BabyDoge_controller = TextEditingController();


class ParaCekme extends StatefulWidget {
  @override
  _ParaCekme createState() => _ParaCekme();
}

class _ParaCekme extends State<ParaCekme> {
  bool isLoaded = false;
  late BannerAd bannerAd;
  late RewardedAd rewardedAd;

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
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedAd ad){
            ad.dispose();
            loadRewardedAd();
          },
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){
            ad.dispose();
            loadRewardedAd();
          }
      );
      rewardedAd!.setImmersiveMode(true);
      rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward){
      });
    }
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
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: 520,
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
                                    obscureText: true,
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
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Hesabıma\nAktar',
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

                                  color: Colors.orangeAccent,
                                  duration: 25,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                    showRewardedAdd();
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
                                    obscureText: true,
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
                                          'Hesabıma\nAktar',
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

                                  color: Colors.orangeAccent,
                                  duration: 25,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                    showRewardedAdd();
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
                                    obscureText: true,
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
                                          'Hesabıma\nAktar',
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
                                  color: Colors.orangeAccent,
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
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Cate_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/cate.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'CATE',
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
                                          'Hesabıma\nAktar',
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
                                  color: Colors.orangeAccent,
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
                                    obscureText: true,
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
                                          'Hesabıma\nAktar',
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
                                  color: Colors.orangeAccent,
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
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: BabyDoge_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/babydoge.png',width: 25,height: 25,),
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
                                          'Hesabıma\nAktar',
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
                                  color: Colors.orangeAccent,
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
    rewardedAd.dispose();
    bannerAd.dispose();
    loadBannerAd();
    loadRewardedAd();
  }
}

