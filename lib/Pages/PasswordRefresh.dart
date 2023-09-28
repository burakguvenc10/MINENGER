import 'dart:convert';
import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:minenger/Component/Mail_Validation_Popup.dart';
import 'package:minenger/Pages/Login.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:http/http.dart' as http;

const button_color = Color.fromRGBO(235, 189, 94 ,1);
final passwordRefresh_controller = TextEditingController();
String _errorMessage = '';
late Box passwordRefreshBox;

class PasswordRefresh extends StatefulWidget {
  @override
  _PasswordRefresh createState() => _PasswordRefresh();
}

class _PasswordRefresh extends State<PasswordRefresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child:Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shadowColor: Colors.grey,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(20.0),
              child:SingleChildScrollView(
                child:Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),

                    Image.asset('assets/logo_yazi.png', color: Colors.orangeAccent.shade200, fit: BoxFit.cover, width: 180),

                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      style: TextStyle(fontSize: 17),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      controller: passwordRefresh_controller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Mail Adresinizi Yazınız',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: passwordRefresh_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
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
                        validateEmail(deger);
                      },
                    ),


                    SizedBox(
                      height: 35,
                    ),


                    AnimatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Yeni Şifre Gönder',
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
                        SendMail();
                        var mail = passwordRefresh_controller.value.text;
                        var validateMail = validateEmail(mail);
                        if(mail.isNotEmpty && validateMail == true){
                          showAnimatedDialog(
                            alignment: Alignment.center,
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return ClassicGeneralDialogWidget(
                                actions: [
                                  Mail_Validation_Popup(),
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
                      }
                    ),
                  ],
                ),




              ),
            ),
          ),
        ),
      ),
    );
  }

  Future SendMail({code}) async{
    final service_id = "service_w9gzuxn";
    final template_id = "template_q2n61jw";
    final user_id = "ciFDAEMgWlyVWOzPn";
    final private_key = "XyeoSFBSRds6hFzbehhey";
    String code = "";
    for(int i = 1; i<5; i++){
      var rnd = new Random();
      int sayi = rnd.nextInt(10);
      code = code + sayi.toString();
    }
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    try{
      var response = await http.post(url,
          headers: {
            'origin':'http://localhost',
            'content-Type': 'application/json'
          },
          body: json.encode({
            'service_id':service_id,
            'template_id':template_id,
            'user_id':user_id,
            'template_params': {
              'code': code,
              'g-recaptcha-response': private_key
            }
          }));
      print('[MAIL RESPONSE OK:] ${response.body}');
      passwordRefreshBox = await Hive.openBox('refresh');
      passwordRefreshBox.put('refresh',code);
    }catch(error){
      print('MAIL ERROR');
    }
  }

  Future RandomNumber() async{
    String code = "";
    for(int i = 1; i<5; i++){
      var rnd = new Random();
      int sayi = rnd.nextInt(10);
      code = code + sayi.toString();
    }
    print('[Code :] $code');
    return code;
  }

  bool validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email Adresi Boş Olamaz!";
        statu = false;
      });
      return statu;
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Geçersiz Email Adresi";
        statu = false;
      });
      return statu;
    }else{
      setState(() {
        _errorMessage = "";
        statu = true;
      });
      return statu;
    }
  }


  @override
  void initState(){
    super.initState();
    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}