import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic_notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color.fromRGBO(239, 159, 56, 1),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        ),
      ],

      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',

        ),
      ],
      debug: true,
    );

      await AwesomeNotifications().isNotificationAllowed().then(
            (isAllowed) async {
          if (!isAllowed) {
            await AwesomeNotifications().requestPermissionToSendNotifications();
          }
        },
      );

      await AwesomeNotifications().setListeners(
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismisActionReceivedMethod,
        onActionReceivedMethod: onActionReceivedMethod,
      );
    }

      static Future<void> onNotificationCreatedMethod(
        ReceivedNotification receivedNotification) async{
          debugPrint('Created Method');
      }

      static Future<void> onNotificationDisplayedMethod(
        ReceivedNotification receivedNotification) async{
          debugPrint('Displayed Method');
      }

      static Future<void> onDismisActionReceivedMethod(
        ReceivedNotification receivedNotification) async{
          debugPrint('onDismisActionReceived Method');
      }

      static Future<void> onActionReceivedMethod(
        ReceivedAction receivedAction) async {
          debugPrint('onActionReceived Method');
          final payload = receivedAction.payload ?? {};
          /*if(payload["navigate"] == "true"){
            MyHomePage.navigatorkey.currentState?.push(
              MaterialPageRoute(
                  builder: (_) => const Anasayfa(),
              ),
            );
          }*/
        }

        static Future<void> showNotification({
          required final String title,
          required final String body,
          final String? summary,
          final Map<String, String>? payload,
          final ActionType actionType = ActionType.Default,
          final NotificationLayout notificationLayout = NotificationLayout.Default,
          final NotificationCategory? category,
          final String? bigPicture,
          final List<NotificationActionButton>? actionButtons,
          final bool scheduled = false,
          final int? interval,
        }) async{
            assert(!scheduled || (scheduled && interval != null));

            await AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: -1,
                    channelKey: 'high_importance_channel',
                    title: title,
                    body: body,
                    actionType: actionType,
                    notificationLayout: notificationLayout,
                    summary: summary,
                    category: category,
                    payload: payload,
                    bigPicture: bigPicture,
                ),
              actionButtons: actionButtons,
              schedule: scheduled
                ?NotificationInterval(
                  interval: interval,
                  timeZone:
                    await AwesomeNotifications().getLocalTimeZoneIdentifier(),
                    preciseAlarm: true,
                )
                  :null,
            );
        }



}