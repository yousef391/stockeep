import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockeep/core/utils/Gotouter.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/data/repo/Authrepoimpl.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';

void main() {
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
        listener: (context, state) {
        },
        builder: (context, authstate) {
          
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'stockkeep',
            theme: ThemeData(
              appBarTheme:AppBarTheme(backgroundColor: Colors.white) ,
              scaffoldBackgroundColor: Colors.white
            ),
            routerConfig: routerapp.router,
          );
        },
      ),
    );
  }
}
