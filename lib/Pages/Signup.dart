import 'dart:convert';
import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:minenger/Pages/Login.dart';
import 'package:icons_plus/icons_plus.dart';
import '../Component/Signup_Validation_Popup.dart';
import '../Component/Webview_Signup.dart';
import 'package:http/http.dart' as http;

const button_color = Color.fromRGBO(235, 189, 94 ,1);
final KullaniciAdi_controller = TextEditingController(text: '');
final Mail_controller = TextEditingController();
final Sifre_controller = TextEditingController();
final SifreKontrol_controller = TextEditingController();
final ReferansKodu_controller = TextEditingController();
final CepTelefon_controller = TextEditingController();
bool isHiddenPassword = true;
bool isHiddenPassword2 = true;
String _errorMessage = '';
late Box signupBox;

class Signup extends StatefulWidget {
  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shadowColor: Colors.grey,
            child: Container(
              height: 680,
              padding: const EdgeInsets.all(20.0),
              child:SingleChildScrollView(
                child:Column(
                  children: [

                    Image.asset('assets/logo_yazi.png', color: Colors.orangeAccent.shade200, fit: BoxFit.cover, width: 180),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      controller: KullaniciAdi_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '* Kullanıcı Adı',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: KullaniciAdi_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
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
                      controller: Mail_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '* Email',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: Mail_controller.clear,
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
                      },
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      controller: Sifre_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: isHiddenPassword,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '* Şifre',
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
                      controller: SifreKontrol_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: isHiddenPassword2,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '* Şifre Tekrar',
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
                      height: 15,
                    ),

                    TextFormField(
                      controller: ReferansKodu_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Referans Kodu',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: ReferansKodu_controller.clear,
                          icon: Icon(FontAwesome.paste),
                          color: Colors.black45,
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(OctIcons.cross_reference_24),
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

                    IntlPhoneField(
                      controller: CepTelefon_controller,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: '* Cep Telefonu',
                        suffixIcon: IconButton(
                          onPressed: CepTelefon_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                        labelStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.normal),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      initialCountryCode: 'TR',
                      onChanged: (phone) {

                      },
                    ),

                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (value){
                              isChecked = !isChecked;
                              setState(() {

                              });
                            }
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Webview_item()));
                          },
                          child: new Padding(
                            padding: new EdgeInsets.all(10.0),
                            child: Text(
                              "Kullanım Koşullarını Kabul Ediyorum.",
                              style: TextStyle(color: Colors.blueAccent.shade200,fontSize: 15,decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),


                    AnimatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Kaydol',
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
                        var mail = Mail_controller.value.text;
                        var validateMail = validateEmail(mail);
                        var kullaniciAdi = KullaniciAdi_controller.value.text;
                        var sifre = Sifre_controller.value.text;
                        var sifreControl = SifreKontrol_controller.value.text;
                        var cepTel = CepTelefon_controller.value.text;
                        var referansKodu = ReferansKodu_controller.value.text;

                        if((mail.isNotEmpty && validateMail == true) && kullaniciAdi.isNotEmpty && sifre.isNotEmpty && sifreControl.isNotEmpty && cepTel.isNotEmpty && (sifre == sifreControl)){
                          SendMail();
                          showAnimatedDialog(
                            alignment: Alignment.center,
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return ClassicGeneralDialogWidget(
                                actions: [
                                  Signup_Validation_Popup(),
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
                        else if((mail.isNotEmpty && validateMail == true) && (sifre != sifreControl) && kullaniciAdi.isNotEmpty && sifre.isNotEmpty && sifreControl.isNotEmpty && cepTel.isNotEmpty){
                            Dialogs.materialDialog(
                                color: Colors.white,
                                msg: 'UYARI MESAJI',
                                context: context,
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                    },
                                    text: 'Şifre alanları birbiriyle aynı olmalıdır!',
                                    iconData: Iconsax.warning_2,
                                    color: Colors.red,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                ]);
                        }
                        else if((mail.isNotEmpty && validateMail == false) && kullaniciAdi.isNotEmpty && sifre.isNotEmpty && sifreControl.isNotEmpty && cepTel.isNotEmpty){
                              Dialogs.materialDialog(
                                color: Colors.white,
                                msg: 'UYARI MESAJI',
                                context: context,
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                    },
                                    text: 'Geçerli bir Email adresi yazınız!',
                                    iconData: Iconsax.warning_2,
                                    color: Colors.red,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                              ]);
                        }
                        else{
                          Dialogs.materialDialog(
                              color: Colors.white,
                              msg: 'UYARI MESAJI',
                              context: context,
                              actions: [
                                IconsButton(
                                  onPressed: () {
                                  },
                                  text: 'Lütfen zorunlu alanları doldurunuz!',
                                  iconData: Iconsax.warning_2,
                                  color: Colors.red,
                                  textStyle: TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                          ]);
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
         ),
        ),
      ),
    );
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
          'mail':Mail_controller.value.text,
          'g-recaptcha-response': private_key
          }
        }));
      print('[MAIL RESPONSE OK:] ${response.body}');
      signupBox = await Hive.openBox('validation');
      signupBox.put('validation',code);
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

  @override
  void initState(){
    super.initState();
    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    //Controllers,

    ]);
  }
}