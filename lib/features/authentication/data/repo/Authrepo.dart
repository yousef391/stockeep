import 'package:dartz/dartz.dart';
import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/features/authentication/data/models/UserM.dart';
abstract class Authrepo {
Future<Either<Failure, UserM>> login(String email,String password);

}