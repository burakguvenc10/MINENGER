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
      child: Stack(
        children:[
          // Coin Ikonlar
          Column(
            children: [

              SizedBox(
                height: 12,
              ),

              IconButton(
                tooltip: 'SHIBA',
                icon:  Image.asset(
                  'assets/shiba.png', height: 35, width: 35,
                ),
                iconSize: 50,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Duyurular Yakında...')));

                },
              ),

              SizedBox(
                height: 5,
              ),

              IconButton(
                tooltip: 'TRX',
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
        child: Satoshi(

    )),
    Center(
        child: BabyDoge(

    )),

  ];











