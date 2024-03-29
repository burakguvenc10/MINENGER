import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Anim/Animated_Splash.dart';
import 'Component/NotificationService.dart';
import 'Pages/HomePage.dart';
import 'Pages/AccountInfo.dart';
import 'Pages/WithdrawMoney.dart';
import 'Pages/Referances.dart';
import 'Pages/Notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();
  await Hive.initFlutter();
  runApp(const MyApp());
}
const appbarColor = Color.fromRGBO(235, 189, 94 ,1);
const bottombarColor = Color.fromRGBO(252, 207, 38  ,1);

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
    ParaCekme(),
    Referanslar(),
    HesapBilgileri()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tumSayfalar[selectedItem],
      appBar: AppBar(
          backgroundColor: appbarColor,
          leading: Container(
            child: Image.asset('assets/free.png',  fit: BoxFit.fill, width: 45,),
          ),
          actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.notifications_sharp,color: Colors.white,),
          tooltip: 'Duyurular',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Duyurular()));
          }),
      ],
        centerTitle: true,
        title: Image.asset('assets/logo_yazi.png', color: Colors.white, fit: BoxFit.cover, width: 160),
      ),

      //drawer: Drawerbar(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: bottombarColor,
          currentIndex: selectedItem,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              label: 'Para Çekme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_rounded),
              label: 'Referanslar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Hesap Bilgileri',
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
