import 'package:flutter/material.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Floki.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/Cate.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/BabyDoge.dart';

final PageController page_controller = PageController(initialPage: 0);
num _curr = 0;
bool selected = true;
const button_color = Color.fromRGBO(235, 189, 94 ,1);


class Pageview extends StatefulWidget {

  final initialPage;
  Pageview(this.initialPage);
  @override
  _PageView createState() => _PageView();
}

class _PageView extends State<Pageview> {
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
            onPageChanged: (num) {
              setState(() {
                _curr = num;
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
        child: Cate()),
    Center(
        child: Satoshi()),
    Center(
        child: BabyDoge()),

  ];

  @override
  void dispose() {
    page_controller.dispose();
  }

}













