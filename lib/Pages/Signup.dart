import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:minenger/Pages/Login.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);

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
              height: 600,
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
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      //controller: coin_controller,
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adı',
                        labelStyle: TextStyle(color: Colors.black),
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
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      //controller: coin_controller,
                      decoration: InputDecoration(
                        labelText: 'Email',
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

                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      //controller: coin_controller,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        labelStyle: TextStyle(color: Colors.black),
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
                      textAlign: TextAlign.left,
                      showCursor: true,
                      cursorColor: Colors.black26,
                      enableInteractiveSelection: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      //controller: coin_controller,
                      decoration: InputDecoration(
                        labelText: '* Şifre Tekrar',
                        labelStyle: TextStyle(color: Colors.black),
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

                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Cep Telefonu',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      initialCountryCode: 'TR',
                      onChanged: (phone) {

                      },
                    ),


                    SizedBox(
                      height: 20,
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