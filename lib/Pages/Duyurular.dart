import 'package:flutter/material.dart';

const appbarColor = Color.fromRGBO(250, 179, 53  ,1);

const bottombarColor = Color.fromRGBO(252, 207, 38  ,1);

class Duyurular extends StatefulWidget {
  @override
  _Duyurular createState() => _Duyurular();
}

class _Duyurular extends State<Duyurular> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,

        centerTitle: true,
        title: Text('DUYURULAR',style: TextStyle(color: Colors.white,fontSize: 25,)),
      ),
      body: Center(
          child:ListView.builder(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 20.0),
            itemCount: 10,
            itemBuilder: (context, index){
              return ListTile(
                title: Card(
                  color: Colors.blueGrey.shade100,
                  elevation: 2,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: [
                      Text('Başlık',textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),

                      SizedBox(
                        height: 10,
                      ),

                      ListTile(
                        title: Text('Son Dakika Duyurular, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like.',style: TextStyle(fontSize: 15),maxLines: 10,),
                        tileColor: Colors.grey.shade200,
                        textColor: Colors.black54,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),

    );


  }
}