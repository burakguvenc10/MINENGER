import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

final coin_controller = TextEditingController();

class Shiba extends StatefulWidget {
  @override
   _Shiba createState() => _Shiba();
}

class _Shiba extends State<Shiba> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Column(
      children: [

        SizedBox(
          height: 20,
        ),

        Text('SHIBA', textAlign: TextAlign.center, style: TextStyle(fontSize: 35,)),

        SizedBox(
          height: 20,
        ),
        
        Container(
          margin: EdgeInsets.fromLTRB(70, 20, 70,0),
          child: TextFormField(
              textAlign: TextAlign.center,
              showCursor: false,
              enableInteractiveSelection: false,
              obscureText: true,
              keyboardType: TextInputType.none,
              autofocus: false,
              controller: coin_controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                  ),
                ),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                hintText: 'Coin Sayacı',
              ),
              maxLines: 1,
              onSaved: (deger) {
              },
              onChanged: (deger) {
              },
          ),
        ),


        Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                    strokeWidth: 6,
                    value: 60,
                  ),
                ),
              ],
            ),
        ),


        AnimatedButton(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/gif/play.gif',color: Colors.white, height: 30,),

                Text(
                  '  Reklam İzle',
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
          enabled : true,
          duration: 25,
          shadowDegree: ShadowDegree.dark,
          width: 190,
          onPressed: () {
          },
        ),

        SizedBox(
          height: 10,
        )


      ],


    );
  }
}







