import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockeep/core/utils/api_service.dart';

import 'package:stockeep/data/models/BCI.dart';

import 'package:stockeep/data/repo/Home_repoimpl.dart';
import 'package:stockeep/presentation/cubit/cubit/addbci_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/addproduct_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/get_bcis_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/get_stati_cubit.dart';

import 'package:stockeep/presentation/cubit/cubit/getarticles_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/getproducts_cubit.dart';

import 'package:stockeep/presentation/cubit/cubit/home_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/notif_cubit.dart';

import 'package:stockeep/presentation/views/Home_view.dart';
import 'package:stockeep/presentation/views/Login_view.dart';
import 'package:stockeep/presentation/views/Notification_view.dart';

import 'package:stockeep/presentation/views/Settings.dart';
import 'package:stockeep/presentation/views/changepass.dart';

import 'package:stockeep/presentation/views/trackingview.dart';

abstract class routerapp {
  static final HomePath = '/home';
  static final CardViewpath = '/Cardview';
  static final KTrackingview = '/trackingview';
  static final KSettings = '/settingsview';
  static final Knotif = '/notif';
   static final Kchangepass = '/pass';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Login_View();
        },
      ),
      GoRoute(
        path: Kchangepass,
        builder: (context, state) {
          return Change_password();
        },
      ),
      GoRoute(
        path: Knotif,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NotifCubit(Homerepoimpl(Api_services(dio: Dio())))..getnot(BlocProvider.of<AuthCubit>(context).user!.id, BlocProvider.of<AuthCubit>(context).user!.token) ,
            child: Notification_View(),
          );
        },
      ),
      GoRoute(
        path: KTrackingview,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                AddbciCubit(Homerepoimpl(Api_services(dio: Dio()))),
            child: Trackingview(
              bciid: state.extra as int,
            ),
          );
        },
      ),
      GoRoute(
        path: KSettings,
        builder: (context, state) {
          return Settings();
        },
      ),
      GoRoute(
          path: HomePath,
          builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) =>
                          GetBcisCubit(Homerepoimpl(Api_services(dio: Dio())))
                            ..getdata(
                                BlocProvider.of<AuthCubit>(context).user!.token,
                                BlocProvider.of<AuthCubit>(context)
                                    .user!
                                    .id
                                    .toString())),
                                    BlocProvider(
                      create: (context) =>
                          GetStatiCubit(Homerepoimpl(Api_services(dio: Dio())))
                            ),
                  BlocProvider(create: (context) => AddproductCubit()),
                  BlocProvider(
                      create: (context) => GetproductsCubit(
                          homerepoimpl: Homerepoimpl(Api_services(dio: Dio())))
                        ..getdata(
                            BlocProvider.of<AuthCubit>(context).user!.token,
                            null)),
                  BlocProvider(
                    create: (context) => GetchapitreCubit(
                        homerepoimpl: Homerepoimpl(Api_services(dio: Dio())))
                      ..getdata(
                          BlocProvider.of<AuthCubit>(context).user!.token),
                  ),
                  BlocProvider(
                      create: (context) =>
                          AddbciCubit(Homerepoimpl(Api_services(dio: Dio())))),
                  BlocProvider(
                      create: (context) => GetarticlesCubit(
                          homerepoimpl:
                              Homerepoimpl(Api_services(dio: Dio())))),
                ],
                child: Home_view(),
              )),
    ],
  );
}
