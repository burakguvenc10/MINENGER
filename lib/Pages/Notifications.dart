import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minenger/Pages/Anasayfa.dart';

const appbarColor = Color.fromRGBO(235, 189, 94 ,1);

class Duyurular extends StatefulWidget {
  @override
  _Duyurular createState() => _Duyurular();
}

class _Duyurular extends State<Duyurular> {

  late NativeAd nativead;
  bool isloaded = false;
  static final _kAdIndex = 4;
  var jsonList;
  var response;
  bool isLoading = false;
  Dio dio = Dio();

  loadNativeAd(){
    nativead = NativeAd(
        adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/2247696110" : "ca-app-pub-3940256099942544/2247696110",
        factoryId: "listTile",
        listener: NativeAdListener(
          onAdLoaded: (_) {
            setState(() {
              isloaded = true;
            });
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();
          }
        ),
        request: AdRequest(),
    );
    nativead.load();
  }

  void getData() async {
    isLoading == true;
    //dio.options.headers['content-type'] = 'application/json';
    //dio.options.headers['authorization'] = 'apikey 6t5uNKw5HvNRrSjIemVprT:6cu8lF6bHMdNClEtMP4iop';
    //dio.options.receiveTimeout= 1000 as Duration?;
    //dio.options.connectTimeout = 1500 as Duration?;
    try {
      response = await Dio().get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data["superheros"] as List;
          isLoading == false;
        });
      }
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Text('DUYURULAR',style: TextStyle(color: Colors.white,fontSize: 25,)),
      ),
      body: !isLoading ? ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: jsonList == null ? 0 :jsonList.length + (isloaded ? 1 : 0),
            itemBuilder: (context, index){
              if (isloaded && index == _kAdIndex) {
                  return Container(
                      child: AdWidget(
                        ad: nativead,
                      ),
                      height: 70,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5)
                  );
              }

              else {
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: appbarColor.withOpacity(0.6),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0,3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Text(
                                 jsonList[index]['name'], //'Duyuru Başlık'
                                 textAlign: TextAlign.center,
                                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,)
                             ),
                           ],
                          ),

                          Container(
                            height: 0.7,
                            margin: EdgeInsets.all(5),
                            color: Colors.grey.shade400,
                          ),

                          ListTile(
                            title: Text(
                              jsonList[index]['power'], //'Duyuru İçerik'
                              //'Son Dakika Duyurular, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like.',
                              style: TextStyle(fontSize: 15)),
                            tileColor: Colors.grey.shade200,
                            textColor: Colors.black54,
                          ),

                          Text(
                              "2023-05-16 10:04:00", //'Duyuru Tarih'
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.grey.shade500)
                          ),

                        ],
                      ),
                    )
                  );
                }
            }
          ): Center(
            child: CircularProgressIndicator(color: button_color,),
        ),
    );

  }

  @override
  void initState(){
    super.initState();
    //Admob-NativeAd
    loadNativeAd();
    getData();
  }

  @override
  void dispose() {
    //Admob-NativeAd
    nativead.dispose();
  }

}