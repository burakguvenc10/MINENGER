import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

final Shiba_controller = TextEditingController();
final Bttc_controller = TextEditingController();
final Floki_controller = TextEditingController();
final Cate_controller = TextEditingController();
final Satoshi_controller = TextEditingController();
final BabyDoge_controller = TextEditingController();


class ParaCekme extends StatefulWidget {
  @override
  _ParaCekme createState() => _ParaCekme();
}

class _ParaCekme extends State<ParaCekme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
                SizedBox(
                  height: 20,
                ),
                  Card(
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: 520,
                      padding: const EdgeInsets.all(20.0),
                      child:SingleChildScrollView(
                        child: Column(
                        children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Shiba_controller,
                                    decoration: InputDecoration(
                                      labelText: 'SHIBA',
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/shiba.png',width: 25,height: 25,),
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),


                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Bttc_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/bttc.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'BTTC',
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Floki_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/floki.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'FLOKI',
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Cate_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/cate.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'CATE',
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: Satoshi_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/satoshi.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'SATOSHI',
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    obscureText: true,
                                    enabled: false,
                                    keyboardType: TextInputType.none,
                                    autofocus: false,
                                    controller: BabyDoge_controller,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: Image.asset('assets/babydoge.png',width: 25,height: 25,),
                                        color: Colors.black54,
                                      ),
                                      labelText: 'BABY DOGE',
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

                                Padding(
                                  padding: const EdgeInsets.all(10.0),),

                                AnimatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Para Çek',
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
                                  enabled: false,
                                  shadowDegree: ShadowDegree.dark,
                                  width: 90,
                                  height: 50,
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}

