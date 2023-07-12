import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:minenger/Component/Webview_Binance.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:clipboard/clipboard.dart';

final Mail_controller = TextEditingController();
final BEP20_controller = TextEditingController();
const button_color = Color.fromRGBO(235, 189, 94 ,1);
bool isBep20Check = false;
bool isBinanceCheck = false;
var coinsayisi = 0;

class Dialog_Detail extends StatefulWidget {
  @override
  _Dialog_Detail createState() => _Dialog_Detail();
}

class _Dialog_Detail extends State<Dialog_Detail> {
  String _IsEmpty = '';
  String beb20_value = BEP20_controller.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: 350,
      color: Colors.grey[200],
      child: Column(
        children: [

          Text("HESABIMA AKTAR",style: TextStyle(fontSize: 22,color: Colors.orange.shade200,fontWeight: FontWeight.bold),textAlign: TextAlign.center),

          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/shiba.png",height: 25,width: 25,),

              SizedBox(width: 5,),

              Text("Shiba Coin : ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.start,),

              SizedBox(width: 5,),

              Text("${coinsayisi}",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.start,),
            ],
          ),

          SizedBox(
            height: 15,
          ),

          Text("*Lütfen BEP-20 Cüzdan Kodunuzu yada Binance Mail Adresini Seçiniz* ",style: TextStyle(fontSize: 11,color: Colors.orange,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),

          Row(
            children: [
              Checkbox(
                  value: isBep20Check,
                  activeColor: Colors.blue.shade800,
                  onChanged: (val){
                    setState(() {
                      if(isBep20Check == false){
                        isBep20Check = true;
                        isBinanceCheck = false;
                      }else{
                        isBep20Check = false;
                        isBinanceCheck = true;
                      }
                    });
                  }
              ),

              SizedBox(
                width: 5,
              ),

              Text("BEP-20",style:TextStyle(fontSize: 17,),),

              SizedBox(
                width: 10,
              ),

              Checkbox(
                  value: isBinanceCheck,
                  activeColor: Colors.orange,
                  onChanged: (val){
                    setState(() {
                      if(isBinanceCheck == false){
                        isBinanceCheck = true;
                        isBep20Check = false;
                      }else{
                        isBinanceCheck = false;
                        isBep20Check = true;
                      }
                    });
                  }
              ),

              Image.asset("assets/binance.png",height: 25,width: 25,),

              SizedBox(
                width: 5,
              ),

              Text("Binance",style:TextStyle(fontSize: 17,),),

            ],
          ),

          SizedBox(width: 5,),

          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Visibility(
                visible: isBinanceCheck,
                  child: TextFormField(
                    controller: Mail_controller,
                    textAlign: TextAlign.left,
                    showCursor: true,
                    cursorColor: Colors.black26,
                    enableInteractiveSelection: false,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Binance E-mail Adresi",
                      labelText: 'E-mail',
                      suffixIcon: IconButton(
                        onPressed: Mail_controller.clear,
                        icon: Icon(Icons.clear_sharp),
                        color: Colors.orange,
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.mail_outline),
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

              Visibility(
                visible: isBep20Check,
                child: TextFormField(
                  controller: BEP20_controller,
                  textAlign: TextAlign.left,
                  showCursor: true,
                  cursorColor: Colors.black26,
                  enableInteractiveSelection: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "BEP-20 Cüzdan Kodu",
                    labelText: 'BEP-20',
                    suffixIcon: IconButton(
                      onPressed: (){
                        final paste_value = FlutterClipboard.paste().toString();
                        setState(() {
                          beb20_value = paste_value;
                        });
                      },
                      icon: Icon(Icons.paste_sharp),
                      color: Colors.black54,
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.token),
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
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          AnimatedButton(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Gönder',
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
            enabled: true,
            duration: 30,
            shadowDegree: ShadowDegree.dark,
            height: 60,
            onPressed: () {
              Dialogs.bottomMaterialDialog(
                  msg: 'Bilgilerinizi Doğru Yazdığınızı Onaylıyor musunuz?',
                  title: 'Hesap Onayı',
                  context: context,
                  actions: [
                    IconsOutlineButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'İptal',
                      color: Colors.red,
                      iconData: Icons.cancel_outlined,
                      textStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                    IconsButton(
                      onPressed: () {
                        Dialogs.materialDialog(
                            color: Colors.white,
                            msg: 'İşleminiz Onaylandı. 2-3 Gün İçerisinde Hesabınıza Aktarılacaktır.',
                            title: 'İşlem Başarılı',
                            context: context,
                            actions: [
                              IconsButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                text: 'Kapat',
                                iconData: Icons.done,
                                color: Colors.green,
                                textStyle: TextStyle(color: Colors.white),
                                iconColor: Colors.white,
                              ),
                            ]);
                      },
                      text: 'Onaylıyorum',
                      iconData: Icons.done,
                      color: Colors.green,
                      textStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                  ]);
            },
          ),

          SizedBox(height: 10,),

          Text('hesabınız yok mu?',textAlign: TextAlign.left,style: TextStyle(color: Colors.black26,fontSize: 14)),

          TextButton(
            child: Text('Hesabınız yoksa bu Linkten kayıt olabilirsiniz ',textAlign: TextAlign.left,style: TextStyle(color: Colors.blueAccent,fontSize: 14,decoration: TextDecoration.underline)),
            onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Webview_Binance()));
            },
          ),


        ],
      ),
    );
  }
}