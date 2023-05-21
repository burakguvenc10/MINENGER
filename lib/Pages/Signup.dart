import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:minenger/Pages/Login.dart';

import '../Component/Webview_Signup.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
final KullaniciAdi_controller = TextEditingController();
final Mail_controller = TextEditingController();
final Sifre_controller = TextEditingController();
final SifreKontrol_controller = TextEditingController();
final ReferansKodu_controller = TextEditingController();
final CepTelefon_controller = TextEditingController();

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
          child:Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shadowColor: Colors.grey,
            child: Container(
              height: 630,
              padding: const EdgeInsets.all(20.0),
              child:SingleChildScrollView(
                child:Column(
                  children: [

                    CircleAvatar(
                      backgroundImage: AssetImage('assets/msplash.png',),
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),

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
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adı',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: KullaniciAdi_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.person_outline_outlined),
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
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: Mail_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
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

                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      controller: Sifre_controller,
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: Sifre_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.key),
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
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '* Şifre Tekrar',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: SifreKontrol_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.key),
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
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Referans Kodu',
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: ReferansKodu_controller.clear,
                          icon: Icon(Icons.clear_sharp),
                          color: Colors.orange,
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.account_box_outlined),
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
                      decoration: InputDecoration(
                        labelText: 'Cep Telefonu',
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
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Login()), (_) => false);
                      },
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