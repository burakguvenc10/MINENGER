import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../Component/NotificationService.dart';

final coin_controller = TextEditingController(text: '0');
late final AnimatedButton animButton;
const button_color = Color.fromRGBO(252, 185, 65 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);

class Shiba extends StatefulWidget {
  @override
   _Shiba createState() => _Shiba();
}

class _Shiba extends State<Shiba> {

  static const maxSeconds = 30;
  Timer? timer;
  int seconds = 30;
  bool checkstatu = true;
  late RewardedAd rewardedAd;
  late double sonuc;

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
            NotificationService.showNotification(
                title: "SHIBA COIN",
                body: "Kazıma işlemi Başladı!!",
                scheduled: true,
                interval: 10
            );
            setState(() {
              sonuc = double.parse(coin_controller.value.text) + 10;
              coin_controller.text = sonuc.toString();
              //Timer
              checkstatu = false;
              setState(() => checkstatu);
              seconds = 1;
              startTimer();
            });
          }
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: button_color,
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [turuncu,button_color,Colors.white,Colors.white,Colors.white],
        ),
      ),
      child: Column(
      children: [
        SizedBox(
          height: 20,
        ),

        Text('SHIBA', textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 35,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.white!,
          ),
        ),


        SizedBox(
          height: 20,
        ),

        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50,0),
          child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              showCursor: false,
              enableInteractiveSelection: false,
              obscureText: false,
              keyboardType: TextInputType.none,
              autofocus: false,
              controller: coin_controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                  ),
                ),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                hintText: 'Kazılan Coin',
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Image.asset('assets/shiba.png',width: 25,height: 25,),
                  ),
                ),
              maxLines: 1,
              onSaved: (deger) {
              },
              onChanged: (deger) {
                setState(() {
                  coin_controller.value.text;
                });
              },
          ),
        ),

        Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blueGrey.shade200),
                    backgroundColor: button_color,
                    color: Colors.redAccent,
                    strokeWidth: 8,
                    value: 1- seconds / maxSeconds,
                  ),
                ),
                Center(
                  child: buildTime()
                ),
              ],
            ),
        ),


        AnimatedButton(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/play.png',color: Colors.white, height: 30,),

                Text(
                  '  Reklam İzle',
                    style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Akrobat-Regular',
                  ),
                ),
              ],
            ),
          ),
          color: button_color,
          enabled : checkstatu,
          duration: 25,
          shadowDegree: ShadowDegree.dark,
          width: 190,
          onPressed: () async{
            //RewardedAd
            showRewardedAdd();
          },
        ),

        SizedBox(
          height: 10,
        ),


      ],

      ),
    );
  }

  Widget buildTime(){
    if (seconds  == 0){
      checkstatu = true;
      return Icon(
        Icons.done, color: Colors.green, size: 100,
      );
    }
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Kalan Zaman',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade400, fontSize: 10),),
          Text('$seconds' + ' Dakika', textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 1,)
        ],
      );
    }
  }

  void startTimer() async {
    timer = Timer.periodic(Duration(seconds: 1800), (_) async {
      if (seconds > 0) {
        setState(() => seconds--);
        if(seconds == 0){
          await NotificationService.showNotification(
              title: "SHIBA COIN",
              body: "Yeniden Kazımak için Hazır! Tıklayınız...",
              scheduled: true,
              interval: 10
          );
        }
      } else {
        setState(() {
          timer?.cancel();
        });
      }
    });
  }

  void changeEnabled(){
    checkstatu = true;
    setState(() => checkstatu);
  }

  @override
  void initState(){
    super.initState();
    loadRewardedAd();
  }

  @override
  void dispose() {
    rewardedAd.dispose();
  }

}









