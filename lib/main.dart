import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockeep/core/utils/FCM_service.dart';
import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/data/repo/Authrepoimpl.dart';
import 'package:stockeep/firebase_options.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FCM().getperm();
  AwesomeNotifications().initialize(
  
  null,
  [
    NotificationChannel(
      enableVibration: true,
      importance: NotificationImportance.Max,
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
  
  

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
              authrepo: Authrepoimpl(api_services: Api_services(dio: Dio()))),
        
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {},
        builder: (context, authstate) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'stockkeep',
            theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.white),
                scaffoldBackgroundColor: Colors.white),
            routerConfig: routerapp.router,
          );
        },
      ),
    );
  }
}
