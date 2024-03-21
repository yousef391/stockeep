import 'package:dartz/dartz.dart';
import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/features/authentication/data/repo/Authrepo.dart';

class Authrepoimpl implements  Authrepo{
 Authrepoimpl({required this.api_services}) ;
 final Api_services api_services ;

  Future<Either<Login_failure, String>> login(String email,String password) async{ 
   try {
  var response= await api_services.postservice('/user/login/' , {'email':email , 'password': password}) ;
  
  return right(response['tokens']['access']) ;
} on Exception catch (e) {
  return left(Login_failure(e.toString()));
}
  }


}