import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final referanskodu_controller = TextEditingController();

class Referanslar extends StatefulWidget {
  @override
  _Referanslar createState() => _Referanslar();
}

class _Referanslar extends State<Referanslar> {

  String copyCode = referanskodu_controller.text;
  bool isLoaded = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scrollbar(
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
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(20.0),
                      child:Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            controller: referanskodu_controller,
                            decoration: InputDecoration(
                              labelText: 'Referans Kodu',
                              labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  Clipboard.setData(ClipboardData(text: '$copyCode')).then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Panoya Kopyalandı')));
                                  });
                                },
                                icon: Icon(Icons.copy),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
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