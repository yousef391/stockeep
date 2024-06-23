import 'package:dartz/dartz.dart';
import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/data/models/Articles.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/data/models/Chapitre.dart';
import 'package:stockeep/data/models/Notification.dart';

import 'package:stockeep/data/models/Product.dart';




abstract class Homerepo {
Future<Either<Failure, List<Chapitre>>> getchapitre(String token );

Future<Either<Failure, List<Article>>> getarticle(String token , List<int> chapitres_ids);
Future<Either<Failure, List<Product>>> getproducts(String token , List<int>? articles_ids);
Future<Either<Failure, List<Product>>> getproductsbyfirstletters(String token , String firstletters);
 Future<Either<Failure, List<BCi>>> getBcis(String token , String consid) ;
 Future<Either<Failure, BCi>> postBci(BCi bCi);
  Future<Failure?> deleteBci(BCi bCi , String token);
  Future<Either<Failure, BCi>> getBci(String token , int bciid) ;
   Future<Either<Failure, List<Notif>>> getnoti(String token ,int userid);
   Future readnot(String token , int id);
   Future deletenot(String token, int id);
    Future<Either<Failure, Map<String,int>>> getstatistics(String token , String consid) ;
    
   
   

}