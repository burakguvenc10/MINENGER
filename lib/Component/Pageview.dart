import 'package:flutter/material.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Floki.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/BabyDoge.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/FlightClup.dart';

final initialPage= 0;
final keepPage= true;
final PageController page_controller = PageController(initialPage: initialPage, keepPage: keepPage);
const button_color = Color.fromRGBO(235, 189, 94 ,1);
const acik_turuncu = Color.fromRGBO(239, 159, 56 ,1);
const turuncu = Color.fromRGBO(255, 116, 5 ,1);
const siyah = Color.fromRGBO(40, 40, 48 ,1);
const gri = Color.fromRGBO(122, 159, 191 ,1);
const button_color_light = Color.fromRGBO(220, 185, 65 ,1);
const acikmavi = Color.fromRGBO(61,142,185,1);
const mavi = Color.fromRGBO(44,130,201 ,1);


class Pageview extends StatefulWidget {
  Pageview(initialPage);
  @override
  _PageView createState() => _PageView();
}

class _PageView extends State<Pageview> {
  bool selected_ShibaIcon = false;
  bool selected_BttcIcon = false;
  bool selected_FlokiIcon = false;
  bool selected_CateIcon = false;
  bool selected_SatoshiIcon = false;
  bool selected_FightclupIcon = false;
  Color ShibaCardColor = Colors.grey.shade300;
  Color BttcCardColor = Colors.grey.shade300;
  Color FlokiCardColor = Colors.grey.shade300;
  Color BabyDogeCardColor = Colors.grey.shade300;
  Color SatoshiCardColor = Colors.grey.shade300;
  Color FLightClupCardColor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 270,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child:
          PageView(
            controller: page_controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (num) {
              setState(() {
                /*if(num == 0){
                  setState(() {
                    selected_ShibaIcon = true;
                    ShibaCardColor = turuncu;
                    BttcCardColor = Colors.transparent;
                    FlokiCardColor = Colors.transparent;
                    BabyDogeCardColor = Colors.transparent;
                    SatoshiCardColor = Colors.transparent;
                    FLightClupCardColor = Colors.transparent;
                  });
                }
                else if( num == 1){
                  setState(() {
                    selected_BttcIcon = true;
                    BttcCardColor = siyah;
                    ShibaCardColor = Colors.transparent;
                    FlokiCardColor = Colors.transparent;
                    BabyDogeCardColor = Colors.transparent;
                    SatoshiCardColor = Colors.transparent;
                    FLightClupCardColor = Colors.transparent;
                  });
                }
                else if( num == 2){
                  setState(() {
                    selected_FlokiIcon = true;
                    FlokiCardColor = gri;
                    BttcCardColor = Colors.transparent;
                    ShibaCardColor = Colors.transparent;
                    BabyDogeCardColor = Colors.transparent;
                    SatoshiCardColor = Colors.transparent;
                    FLightClupCardColor = Colors.transparent;
                  });
                }*/
              });
            },
            children: _list,
          ),
       ),
    );
  }


  final List<Widget> _list = <Widget>[
    Center(
        child: Shiba()),
    Center(
        child: Bttc()),
    Center(
        child: Floki()),
    Center(
        child: BabyDoge()),
    Center(
        child: Satoshi()),
    Center(
        child: FightClup()),

  ];


  @override
  void initState() {
  }

  @override
  void dispose() {
    page_controller.dispose();
  }

}













