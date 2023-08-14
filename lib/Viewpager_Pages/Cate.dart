import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

final coin_controller = TextEditingController();
late final AnimatedButton animButton;
const button_color = Color.fromRGBO(252, 185, 65 ,1);
const pembe = Color.fromRGBO(240, 194, 194 ,1);
const koyu_pembe = Color.fromRGBO(194, 83, 150 ,1);

class Cate extends StatefulWidget {
  @override
  _Cate createState() => _Cate();
}

class _Cate extends State<Cate> {

  static const maxSeconds = 30;
  Timer? timer;
  int seconds = 30;
  bool checkstatu = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [koyu_pembe,pembe,Colors.white,Colors.white,Colors.white],
      ),
    ),
    child: Column(
      children: [

        SizedBox(
          height: 20,
        ),

        Text('CATE', textAlign: TextAlign.center, style: TextStyle(
          fontSize: 35,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.white!,
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
                  color: Colors.black,
                ),
              ),
              errorStyle: TextStyle(color: Colors.redAccent),
              border: OutlineInputBorder(),
              hintText: 'Kazılan Coin',
              suffixIcon: IconButton(
                onPressed: (){},
                icon: Image.asset('assets/cate.png',width: 25,height: 25,),
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
                  backgroundColor: koyu_pembe,
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
            seconds = 29;
            startTimer();
          },
        ),

        SizedBox(
          height: 10,
        )


      ],

     ),
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
    timer = Timer.periodic(Duration(milliseconds: 60000), (_) {
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









