import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Anim/Animated_splash.dart';
import 'Pages/Anasayfa.dart';
import 'Pages/HesapBilgileri.dart';
import 'Pages/ParaCekme.dart';
import 'Pages/Referanslar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Akrobat-Semibold',
      ),
      home: Animated_splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedItem = 0;
  final List<Widget> tumSayfalar = [
    Anasayfa(),
    HesapBilgileri(),
    ParaCekme(),
    Referanslar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tumSayfalar[selectedItem],
      appBar: AppBar(
        centerTitle: true,
        title: Text('MINENGER')//Image.asset('assets/Logo.png', color: Colors.white, fit: BoxFit.cover, width: 100,),
      ),

      //drawer: Drawerbar(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          currentIndex: selectedItem,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Hesap Bilgileri',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Para Çekme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_rounded),
              label: 'Referanslar',
            ),
          ],
          onTap: (index){
            setState(() {
              selectedItem = index;
            });
          }
      ),

    );
  }




  @override
  void initState(){
    super.initState();
    //Ekran dönmesini engelleme
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
  }
}
