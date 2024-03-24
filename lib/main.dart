import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/features/authentication/data/repo/Authrepoimpl.dart';
import 'package:stockeep/features/authentication/presentation/cubit/cubit/auth_cubit.dart';

import 'features/authentication/presentation/views/Login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home : BlocProvider(
        create: (context) => AuthCubit(authrepo: Authrepoimpl(api_services: Api_services(dio: Dio()))),
        child:Login_View(),
      )
      );
      }
}