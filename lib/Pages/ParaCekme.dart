import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

final Shiba_controller = TextEditingController();
final Trx_controller = TextEditingController();
final Bttc_controller = TextEditingController();


class ParaCekme extends StatefulWidget {
  @override
  _ParaCekme createState() => _ParaCekme();
}

class _ParaCekme extends State<ParaCekme> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Scrollbar(
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
                      height: 450,
                      padding: const EdgeInsets.all(20.0),
                      child:Column(
                        children: [
                          TextFormField(
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
                            height: 20,
                          ),

                          TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: true,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            controller: Trx_controller,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'TRX',
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
                            height: 20,
                          ),


                          TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: false,
                            enableInteractiveSelection: false,
                            obscureText: true,
                            keyboardType: TextInputType.none,
                            autofocus: false,
                            controller: Bttc_controller,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
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

                          SizedBox(
                            height: 45,
                          ),

                          AnimatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '  Para Çek',
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
                            width: 200,
                            onPressed: () {

                            },
                          ),
                        ],
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