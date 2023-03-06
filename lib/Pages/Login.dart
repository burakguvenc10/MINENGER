import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:minenger/Pages/PasswordRefresh.dart';
import 'package:minenger/Pages/Signup.dart';
import 'package:minenger/main.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
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
            height: 420,
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

                TextButton(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('Şifremi Unuttum?',textAlign: TextAlign.right,style: TextStyle(color: Colors.orange)),
                  ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PasswordRefresh()));
                    },
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
                  color: Colors.orangeAccent,
                  duration: 25,
                  shadowDegree: ShadowDegree.dark,
                  width: 180,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage()));
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
                        child: Text('hesabınız yok mu?',textAlign: TextAlign.left,style: TextStyle(color: Colors.black26,fontSize: 14)),
                        onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Signup()));
                          },
                      ),

                      TextButton(
                        child: Text('KAYDOL',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 18)),
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
            ),
          ),
        ),
    );
  }
}