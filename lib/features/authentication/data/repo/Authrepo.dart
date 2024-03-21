import 'package:dartz/dartz.dart';
import 'package:stockeep/core/utils/Failure.dart';
abstract class Authrepo {
Future<Either<Login_failure, String>> login(String email,String password);

}