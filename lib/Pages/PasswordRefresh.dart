import 'package:animated_button/animated_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:minenger/Pages/Login.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);
final passwordRefresh_controller = TextEditingController();
String _errorMessage = '';

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
                        var mail = passwordRefresh_controller.value.text;
                        var validateMail = validateEmail(mail);
                        if(mail.isNotEmpty && validateMail == true){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Mail Adresinize Gönderilmiştir."),
                              backgroundColor: Colors.green,
                            ));
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