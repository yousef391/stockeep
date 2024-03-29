import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/data/repo/Authrepoimpl.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/views/Home_view.dart';


abstract class routerapp {
  static final HomePath = '/home';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(authrepo: Authrepoimpl(api_services: Api_services(dio: Dio()))),
            child: Home_view(),
          );
        },
      ),
      GoRoute(
        path: HomePath,
        builder: (context, state) => Home_view(),
      ),
    ],
  );
}
