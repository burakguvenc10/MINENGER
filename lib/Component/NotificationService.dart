import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  final FlutterLocalNotificationsPlugin flutterLocaLNotificationPlugin =  FlutterLocalNotificationsPlugin();

  var androidInitialize = new AndroidInitializationSettings('@mipmap/ic_launcher');

  var iOSInitialize = new IOSInitializationSettings();

  void initializeNotification() async{
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize );

    await flutterLocaLNotificationPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        new AndroidNotificationDetails(
            'channelId',
            'channelName',
             importance: Importance.max,
             priority: Priority.high,
             playSound: true,
        );

    NotificationDetails notificationDetails = new NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocaLNotificationPlugin.show(
        0,
        title,
        body,
        notificationDetails,
    );
  }



}