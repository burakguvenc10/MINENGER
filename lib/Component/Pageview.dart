import 'package:flutter/material.dart';
import '../Viewpager_Pages/Shiba.dart';
import '../Viewpager_Pages/Trx.dart';
import '../Viewpager_Pages/Bttc.dart';
import '../Viewpager_Pages/Cate.dart';
import '../Viewpager_Pages/Satoshi.dart';
import '../Viewpager_Pages/BabyDoge.dart';

class Pageview extends StatefulWidget {
  @override
  _PageView createState() => _PageView();
}

class _PageView extends State<Pageview> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    num _curr = 0;

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return Container(
      height: 450,
      color: Colors.grey.shade200,
      child: Stack(
        children:[

          // Coin Ikonlar
          Column(
            children: [

              SizedBox(
                height: 12,
              ),

              IconButton(
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
                icon:  Image.asset(
                  'assets/trx.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {},
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
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
                icon:  Image.asset(
                  'assets/cate.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {},
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
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
              });
            },
            children: _list,
          ),
        ],
      ),
    );

  }
}


  final List<Widget> _list = <Widget>[
    Center(
        child: Shiba(

    )),
    Center(
        child: Trx(

    )),
    Center(
        child: Bttc(

    )),
    Center(
        child: Cate(

    )),
    Center(
        child: Coin(

    )),
    Center(
        child: BabyDoge(

    )),

  ];











