import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/data/models/UserM.dart';
import 'package:stockeep/data/repo/Authrepo.dart';


class Authrepoimpl implements Authrepo {
  Authrepoimpl({required this.api_services});
  final Api_services api_services;
  UserM? user;

  Future<Either<Failure, UserM>> login(String email, String password) async {
    try {
      var response = await api_services.postservice('/user/login/', {'email': email, 'password': password});
      
      String token = response.data['tokens']['access'];
      
      var getresponse = await api_services.getservice('/user/rud/${response.data['id']}/' , token);
      UserM user = UserM.fromjson(getresponse.data);
      user.token = token;
      user=user;
     
      
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }
}
