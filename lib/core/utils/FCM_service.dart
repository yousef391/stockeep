
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
  
class FCM {
  Future getperm() async {
  
final settings= await FirebaseMessaging.instance.requestPermission();
// For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
  String? token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token');

if (token != null) {

 
}
FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

  await AwesomeNotifications().createNotification(

      content: NotificationContent(
        playState: NotificationPlayState.buffering,
        actionType: ActionType.SilentBackgroundAction,
        criticalAlert: true,
        autoDismissible: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
          id: 1,
          channelKey: 'basic_channel',
          title: message.notification!.title ,
          body:
              message.notification!.body,
       
      )
    );
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  
  }






}


