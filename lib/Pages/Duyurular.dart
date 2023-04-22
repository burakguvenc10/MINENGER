import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const appbarColor = Color.fromRGBO(235, 189, 94 ,1);
const bottombarColor = Color.fromRGBO(252, 207, 38  ,1);

class Duyurular extends StatefulWidget {
  @override
  _Duyurular createState() => _Duyurular();
}

class _Duyurular extends State<Duyurular> {

  late NativeAd nativead;
  bool isloaded = false;
  List<Object> itemlist = [];
  static final _kAdIndex = 4;

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
    for(int i=1; i<20;i++){
      itemlist.add("Row $i");
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
      body: Center(
          child:ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: itemlist.length + (isloaded ? 1 : 0),
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
                    title: Card(
                      color: Colors.blueGrey.shade100,
                      elevation: 2,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text('Duyuru Başlık', textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),

                          SizedBox(
                            height: 10,
                          ),

                          ListTile(
                            title: Text(
                              'Son Dakika Duyurular, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like.',
                              style: TextStyle(fontSize: 15)),
                            tileColor: Colors.grey.shade200,
                            textColor: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  );
                }
            },
          ),
      ),
    );

  }

  @override
  void initState(){
    super.initState();
    //Admob-NativeAd
    loadNativeAd();
  }

  @override
  void dispose() {
    //Admob-NativeAd
    nativead.dispose();
  }

}