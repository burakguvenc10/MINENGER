import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

final Mail_controller = TextEditingController();
final Sifre_controller = TextEditingController();

class Dialog_Detail extends StatefulWidget {
  @override
  _Dialog_Detail createState() => _Dialog_Detail();
}

class _Dialog_Detail extends State<Dialog_Detail> {
  String _IsEmpty = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      color: Colors.grey[200],
      child: Column(
        children: [

          Image.asset('assets/helmet.png',height: 40,alignment: Alignment.topCenter,),

          SizedBox(
            height: 5,
          ),

          TextFormField(
            controller: Mail_controller,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent),
              border: OutlineInputBorder(),
              labelText: 'E-Posta',
              suffixIcon: IconButton(
                onPressed: Mail_controller.clear,
                icon: Icon(Icons.clear_sharp),
                color: Colors.orange,
              ),
              hintText: 'E-Posta Adresini Yazınız',
            ),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            onSaved: (deger) {
              _IsEmpty = deger!;
              setState(() {});
            },
            onChanged: (deger) {
              setState(() {});
            },

            validator: (deger) {
              if (deger!.isEmpty) {
                return 'Bir Değer Girmediniz!';
              } else {
                return null;
              }
            },
          ),

          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 10,
          ),

          AnimatedButton(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Akrobat-Regular',
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.orangeAccent,
            enabled: true,
            duration: 30,
            shadowDegree: ShadowDegree.dark,
            height: 38,
            onPressed: () {},
          ),

          SizedBox(
            height: 5,
          ),

          AnimatedButton(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Image.asset('assets/facebook.png',height: 25, width: 25,),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Facebook ile Devam Et',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Akrobat-Regular',
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.blueAccent,
            enabled: true,
            duration: 30,
            shadowDegree: ShadowDegree.dark,
            height: 37,
            onPressed: () {},
          ),


        ],
      ),
    );
  }
}