import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

final coin_controller = TextEditingController();
late final AnimatedButton animButton;
const button_color = Color.fromRGBO(252, 185, 65 ,1);

class Satoshi extends StatefulWidget {
  @override
  _Satoshi createState() => _Satoshi();
}

class _Satoshi extends State<Satoshi> {

  static const maxSeconds = 60;
  Timer? timer;
  int seconds = 60;
  bool checkstatu = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 20,
        ),

        Text('SATOSHI', textAlign: TextAlign.center, style: TextStyle(
          fontSize: 35,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.orange[400]!,
          ),
        ),

        SizedBox(
          height: 20,
        ),

        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50,0),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
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
              hintText: 'Kazılan Coin',
              suffixIcon: IconButton(
                onPressed: (){},
                icon: Image.asset('assets/satoshi.png',width: 25,height: 25,),
              ),
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
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blueGrey.shade200),
                  backgroundColor: button_color,
                  color: Colors.redAccent,
                  strokeWidth: 8,
                  value: 1- seconds / maxSeconds,
                ),
              ),
              Center(
                  child: buildTime()
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
                Image.asset('assets/play.png',color: Colors.white, height: 30,),

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
          color: button_color,
          enabled : checkstatu,
          duration: 25,
          shadowDegree: ShadowDegree.dark,
          width: 190,
          onPressed: () {
            checkstatu = false;
            setState(() => checkstatu);
            seconds = 60;
            startTimer();
          },
        ),

        SizedBox(
          height: 10,
        )


      ],


    );
  }

  Widget buildTime(){
    if(seconds  == 0){
      checkstatu = true;
      return Icon(
        Icons.done, color: Colors.green, size: 100,
      );
    }
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Kalan Zaman',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade400,fontSize: 10),),
          Text('$seconds' + ' Dakika', textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 1,)
        ],
      );
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 60), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        setState(() {
          timer?.cancel();
        });
      }
    });
  }

  void changeEnabled(){
    checkstatu = true;
    setState(() => checkstatu);
  }


}









