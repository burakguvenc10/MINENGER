import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class HesapBilgileri extends StatefulWidget {
  @override
  _HesapBilgileri createState() => _HesapBilgileri();
}

class _HesapBilgileri extends State<HesapBilgileri> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  Card(
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: 510,
                      padding: const EdgeInsets.all(20.0),
                      child:SingleChildScrollView(
                      child:Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            backgroundColor: Colors.white,
                            child: Padding(padding: EdgeInsets.all(5.0)),
                            radius: 45,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            textAlign: TextAlign.left,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            enabled: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: 'Kullanıcı Adı',
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.person),
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
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: false,
                            enabled: false,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            //controller: coin_controller,
                            decoration: InputDecoration(
                              labelText: 'Mail',
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
                              labelText: 'Yeni Şifre',
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
                              labelText: '* Yeni Şifre Tekrar',
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
                            height: 25,
                          ),

                          AnimatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Güncelle',
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
                            width: 120,
                            height: 50,
                            onPressed: () {
                            },
                          ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}