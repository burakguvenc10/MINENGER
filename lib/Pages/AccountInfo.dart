import 'dart:io';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'Login.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HesapBilgileri extends StatefulWidget {
  @override
  _HesapBilgileri createState() => _HesapBilgileri();
}

class _HesapBilgileri extends State<HesapBilgileri> {
  bool isLoaded = false;
  late BannerAd bannerAd;
  bool isHiddenPassword = true;
  bool isHiddenPassword2 = true;

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

                  Container(
                      height: 545,
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
                      child:Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              CircleAvatar(
                                backgroundImage: AssetImage('assets/msplash.png'),
                                backgroundColor: Colors.white,
                                child: Padding(padding: EdgeInsets.all(5.0)),
                                radius: 40,
                              ),

                              SizedBox(
                                width: 60,
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: (){
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (_) => false);
                                        /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Başarıyla Çıkış Yapıldı"),
                                          backgroundColor: Colors.white38,
                                        ));*/
                                      },
                                      icon: Icon(BoxIcons.bx_exit ,color: Colors.red,size: 33,)
                                  ),

                                  TextButton(
                                    child: Text('ÇIKIŞ YAP',style: TextStyle(color: Colors.grey,fontSize: 12,height: -2)),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (_) => false);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          TextFormField(
                            textAlign: TextAlign.left,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            style: TextStyle(fontSize: 18),
                            enabled: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: 'Kullanıcı Adı',
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(LineAwesome.user),
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

                          SizedBox(
                            height: 15,
                          ),


                          TextFormField(
                            textAlign: TextAlign.left,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            style: TextStyle(fontSize: 18),
                            enabled: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: 'Mail',
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(CupertinoIcons.mail),
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

                          SizedBox(
                            height: 15,
                          ),


                          TextFormField(
                            textAlign: TextAlign.left,
                            showCursor: true,
                            cursorColor: Colors.black26,
                            enableInteractiveSelection: false,
                            obscureText: isHiddenPassword,
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.visiblePassword,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: 'Yeni Şifre',
                              labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                icon: Icon(isHiddenPassword? Bootstrap.eye: CupertinoIcons.eye),
                                color: Colors.black54,
                                onPressed: (){
                                  isHiddenPassword = !isHiddenPassword;
                                  setState(() {

                                  });
                                },
                              ),
                              prefixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Bootstrap.lock),
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

                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            textAlign: TextAlign.left,
                            showCursor: true,
                            cursorColor: Colors.black26,
                            enableInteractiveSelection: false,
                            style: TextStyle(fontSize: 18),
                            obscureText: isHiddenPassword2,
                            keyboardType: TextInputType.visiblePassword,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: '* Yeni Şifre Tekrar',
                              labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                icon: Icon(isHiddenPassword2? Bootstrap.eye: CupertinoIcons.eye),
                                color: Colors.black54,
                                onPressed: (){
                                  isHiddenPassword2 = !isHiddenPassword2;
                                  setState(() {

                                  });
                                },
                              ),
                              prefixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Bootstrap.lock),
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

                          SizedBox(
                            height: 25,
                          ),

                          AnimatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Güncelle',
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
                            duration: 25,
                            shadowDegree: ShadowDegree.dark,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Şifreniz Güncellenmiştir"),
                                backgroundColor: Colors.green,
                              ));
                            },
                          ),



                          ],
                        ),
                      ),
                  ),
                ],
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
  }

  @override
  void dispose() {
    //Admob-Banner
    bannerAd.dispose();
    loadBannerAd();
  }
}