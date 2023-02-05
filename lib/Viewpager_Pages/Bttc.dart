import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

final coin_controller = TextEditingController();

class Bttc extends StatefulWidget {
  @override
  _Bttc createState() => _Bttc();
}

class _Bttc extends State<Bttc> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Column(
      children: [

        SizedBox(
          height: 20,
        ),

        Text('BTTC', textAlign: TextAlign.center, style: TextStyle(fontSize: 35,)),

        SizedBox(
          height: 20,
        ),

        Container(
          margin: EdgeInsets.fromLTRB(70, 20, 70, 40),
          child: TextFormField(
            controller: coin_controller,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent),
              border: OutlineInputBorder(),
              hintText: 'Coin Sayacı',
            ),
            maxLines: 1,
            onSaved: (deger) {
            },
            onChanged: (deger) {
            },
            keyboardType: TextInputType.none,
            autofocus: false,
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



      ],


    );
  }
}







