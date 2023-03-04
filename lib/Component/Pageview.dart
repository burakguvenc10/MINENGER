import 'package:flutter/material.dart';
import 'package:minenger/Pages/Duyurular.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Floki.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/Cate.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/BabyDoge.dart';

final PageController controller = PageController();
num _curr = 0;
final GlobalKey<FormState> _shibaKey = GlobalKey<FormState>();
bool selected = true;


class Pageview extends StatefulWidget {
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
      child: Stack(
        children:[
          // Coin Ikonlar
          Column(
            children: [

              SizedBox(
                height: 12,
              ),

              IconButton(
                key: _shibaKey,
                tooltip: 'SHIBA',
                disabledColor: Colors.blueGrey.shade100,
                isSelected: selected,
                icon:  Image.asset(
                  'assets/shiba.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {

                },
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'BTTC',
                icon:  Image.asset(
                  'assets/bttc.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {},
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'FLOKI',
                icon:  Image.asset(
                  'assets/floki.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {
                },
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'SATOSHI',
                icon:  Image.asset(
                  'assets/satoshi.png', height: 35, width: 35,
                ),
                disabledColor: Colors.grey,
                iconSize: 50,
                onPressed: () {},
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'CATE',
                icon:  Image.asset(
                  'assets/cate.png', height: 40, width: 40,
                ),
                iconSize: 50,
                onPressed: () {},
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'BABY DOGE',
                icon:  Image.asset(
                  'assets/babydoge.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {},
              ),

            ],
          ),

          PageView(
            controller: controller,
            onPageChanged: (num) {
              setState(() {
                _curr = num;
                selectedButton(_curr);
              });
            },
            children: _list,
          ),
        ],
      ),
    );

  }
  void selectedButton(num state) {
    if(state == 0){

    }
    else if (state == 1){

    }
    else if (state == 2){

    }
    else if (state == 3){

    }
    else if (state == 4){

    }
    else{

    }

  }
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











