import 'dart:async';
import 'package:animated_button/animated_button.dart';
import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:easy_animate/enum/animate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:minenger/Pages/PasswordRefresh.dart';
import 'package:minenger/Pages/Signup.dart';
import 'package:minenger/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hive/hive.dart';

final mail_controller = TextEditingController();
final password_controller = TextEditingController();
const button_color = Color.fromRGBO(235, 189, 94 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);
const siyah = Color.fromRGBO(40, 40, 48 ,1);
const gri = Color.fromRGBO(122, 159, 191 ,1);
const pembe = Color.fromRGBO(240, 194, 194 ,1);
const acik_turuncu = Color.fromRGBO(239, 159, 56 ,1);
const mavi = Color.fromRGBO(44,130,201 ,1);
bool isChecked = false;
bool statu = false;
String _errorMessage = '';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late Box box1;
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.orange.shade200,
        body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
        /*image: DecorationImage(
        image: AssetImage('assets/background.png'),
        fit: BoxFit.cover,),*/
        ),
          padding: const EdgeInsets.all(20.0),
          child:SingleChildScrollView(

            child:Column(
                children:[

                  SizedBox(
                    height: 50,
                  ),

                  FadeInAnimation(
                    animateDirection: AnimateDirection.right,
                    animateType: AnimateType.once,
                    durationMilliseconds: 2500,
                    moveAmount: 700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: turuncu,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'SHIBA',
                            icon:  Image.asset(
                              'assets/shiba.png', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        CircleAvatar(
                          backgroundColor: siyah,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'BTTC',
                            icon:  Image.asset(
                              'assets/bttc.png', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        CircleAvatar(
                          backgroundColor: gri,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'FLOKI',
                            icon:  Image.asset(
                              'assets/floki.png', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Card(
                      color: Colors.grey.shade200,
                      elevation: 5,
                      shadowColor: Colors.grey,
                      child: Container(
                        height: 405,
                        padding: const EdgeInsets.all(20.0),
                          child:Column(
                            children: [
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
                                controller: mail_controller,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: IconButton(
                                    onPressed: mail_controller.clear,
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
                                height: 15,
                              ),

                              TextFormField(
                                textAlign: TextAlign.left,
                                showCursor: true,
                                cursorColor: Colors.black26,
                                enableInteractiveSelection: false,
                                obscureText: isHiddenPassword,
                                style: TextStyle(fontSize: 17),
                                keyboardType: TextInputType.visiblePassword,
                                autofocus: false,
                                controller: password_controller,
                                decoration: InputDecoration(
                                  labelText: 'Şifre',
                                  labelStyle: TextStyle(color: Colors.black),
                                  prefixIcon: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Bootstrap.lock),
                                    color: Colors.black54,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(isHiddenPassword? Bootstrap.eye: CupertinoIcons.eye),
                                    color: Colors.black54,
                                    onPressed: (){
                                      isHiddenPassword = !isHiddenPassword;
                                      setState(() {

                                      });
                                    },
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: isChecked,
                                          onChanged: (value){
                                            isChecked = !isChecked;
                                            setState(() {
                                              login();
                                            });
                                          }
                                      ),

                                      Text(
                                        "Beni Hatırla",
                                        style: TextStyle(color: Colors.black26,fontSize: 15,),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    width: 20,
                                  ),

                                  Spacer(flex: 2),

                                  TextButton(
                                      child: Text('Şifremi Unuttum',style: TextStyle(color: button_color,fontSize: 14)),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PasswordRefresh()),);
                                      },
                                  ),

                                ],
                              ),

                              SizedBox(
                                height: 5,
                              ),

                              AnimatedButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Giriş Yap',
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
                                  var mail = mail_controller.value.text;
                                  var password = password_controller.value.text;
                                  var validateMail = validateEmail(mail);
                                  if(mail.isNotEmpty && password.isNotEmpty && validateMail == true){
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> MyHomePage()), (_) => false);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Hoşgeldin Minengerli "),
                                      backgroundColor: button_color,
                                    ));
                                  }
                                  else if(mail.isNotEmpty && password.isNotEmpty && validateMail == false){
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
                                            text: 'Lütfen Email ve Şifre alanlarını doldurunuz!',
                                            iconData: Iconsax.warning_2,
                                            color: Colors.red,
                                            textStyle: TextStyle(color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                    ]);
                                  }
                                },
                              ),

                              SizedBox(
                                height: 5,
                              ),

                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      child: Text('hesabınız yok mu?',textAlign: TextAlign.left,style: TextStyle(color: Colors.black26,fontSize: 15)),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Signup()));
                                      },
                                    ),

                                    TextButton(
                                      child: Text('KAYDOL',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 21)),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Signup()));
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                  SizedBox(
                      height: 50,
                    ),

                  FadeInAnimation(
                    animateDirection: AnimateDirection.left,
                    animateType: AnimateType.once,
                    durationMilliseconds: 2500,
                    moveAmount: 700,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: pembe,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'CATE',
                            icon:  Image.asset(
                              'assets/cate.png', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        CircleAvatar(
                          backgroundColor: acik_turuncu,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'SATOSHI',
                            icon:  Image.asset(
                              'assets/satoshi.png', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        CircleAvatar(
                          backgroundColor: mavi,
                          radius: 35,
                          child: IconButton(
                            tooltip: 'FLIGHT CLUP',
                            icon:  Image.asset(
                              'assets/flightclup.jpeg', height: 40, width: 40,
                            ),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

              ],
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
    createBox();
  }

  void getData() async {
    if(box1.get('email')!= null){
      mail_controller.text = box1.get('email');
    }
    if(box1.get('pass')!= null){
      password_controller.text = box1.get('pass');
    }
  }

  void createBox() async{
    box1 = await Hive.openBox('logindata');
    getData();
  }

  void login(){
    if(isChecked){
      box1.put('email',mail_controller.value.text);
      box1.put('pass', password_controller.value.text);
    }
  }


}