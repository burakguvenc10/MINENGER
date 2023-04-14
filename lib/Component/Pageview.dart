import 'package:flutter/material.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Floki.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/Cate.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/BabyDoge.dart';

final PageController controller = PageController(initialPage: 0);
num _curr = 0;
bool selected = true;
final GlobalKey<FormState> _shibaKey = GlobalKey<FormState>();

class Pageview extends StatefulWidget {

  final initialPage;
  Pageview(this.initialPage);
  @override
  _PageView createState() => _PageView();
}

class _PageView extends State<Pageview> {
  @override
  Widget build(BuildContext context) {

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return Container(
      height: 450,
      width: 270,
      child: Material(
        child:
          PageView(
            controller: controller,
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

}













