import 'package:dartz/dartz.dart';
import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/data/models/UserM.dart';


abstract class Authrepo {
Future<Either<Failure, UserM>> login(String email,String password);
Future <bool> Verifytoken(String token);
Future <Either<Failure, String>> changepassword(String token , String old_password , String new_Password);


}