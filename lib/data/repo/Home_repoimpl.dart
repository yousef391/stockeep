import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stockeep/core/utils/Failure.dart';
import 'package:stockeep/core/utils/api_service.dart';
import 'package:stockeep/data/models/Articles.dart';
import 'package:stockeep/data/models/BCI.dart';
import 'package:stockeep/data/models/Chapitre.dart';
import 'package:stockeep/data/models/Notification.dart';
import 'package:stockeep/data/models/Product.dart';

import 'package:stockeep/data/repo/Home_repo.dart';

class Homerepoimpl implements Homerepo {
  Homerepoimpl(this.api_services);
  Api_services api_services;
  @override
  Future<Either<Failure, List<Article>>> getarticle(
      String token, List<int> chapitres_ids) async {
    List<Article> articlelist = [];

    try {
      for (var item in chapitres_ids) {
        var response = await api_services.getservice(
            '/service-achat/Chapitre/$item/Articles/', token);

        for (var element in response.data) {
          articlelist.add(Article.fromjson(element));
        }
      }

      return right(articlelist);
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure, List<Chapitre>>> getchapitre(
    String token,
  ) async {
    List<Chapitre> chaplist = [];
    try {
      var response = await api_services.getservice(
          '/service-achat/Chapitre/listcreate/', token);
      for (var element in response.data) {
        chaplist.add(Chapitre.fromjson(element));
      }

      return right(chaplist);
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getproducts(
      String token, List<int>? articles_ids) async {
    List<Product> productlist = [];

    try {
      if (articles_ids != null) {
        productlist = [];

        for (var item in articles_ids) {
          var response = await api_services.getservice(
              '/service-achat/Article/$item/Produits/', token);

          for (var element in response.data) {
            productlist.add(Product.fromjson(element));
          }
        }
      } else {
        productlist = [];
        var response = await api_services.getservice(
            '/service-achat/Produit/listcreate/', token);

        for (var element in response.data) {
          productlist.add(Product.fromjson(element));
        }
      }

      return right(productlist);
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  Future<Either<Failure, List<Product>>> getproductsbyfirstletters(
      String token, String letters) async {
    List<Product> productlist = [];

    try {
      productlist = [];
      var response = await api_services.getservice(
          '/service-achat/Produit/listcreate/', token);
      for (var element in response.data) {
        if (element['designation']
                .toString()
                .toLowerCase()
                .contains(letters.toLowerCase()) ||
            element['designation'].toString().contains(letters.toUpperCase())) {
          productlist.add(Product.fromjson(element));
        }
      }

      return right(productlist);
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  Future<Either<Failure, List<BCi>>> getBcis(
      String token, String consid) async {
    List<BCi> bcis = [];

    try {
      var response = await api_services.getservice(
          '/consom/bondecommandeinterne/listcreate/', token);

      for (var element in response.data) {
        if (element['user_id'].toString() == consid) {
          bcis.add(BCi.fromjson(element));
        }
      }

      return right(bcis.reversed.toList());
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure, BCi>> postBci(BCi bCi) async {
    try {
      Response response = await api_services.postservice(
          '/consom/bondecommandeinterne/listcreate/', bCi.tojson());

      return right(BCi.fromjson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  Future<Failure?> deleteBci(BCi bCi, String token) async {
    try {
      await api_services.deleteservice(
          '/consom/bondecommandeinterne/rud/${bCi.id}/', bCi.tojson(), token);
      return null;
    } catch (e) {
      if (e is DioException) {
        return servicefailure.dioerror(e);
      } else {
        return servicefailure('there is an error try again');
      }
    }
  }

  @override
  Future<Either<Failure, List<Notif>>> getnoti(String token, int userid) async {
    List<Notif> notificationsList = [];
    try {
      Response response =
          await api_services.getservice('/notifications/all/', token);

      print(response.data);
      for (var element in response.data) {
        if (element['recipient'] == userid) {
          notificationsList.add(Notif.fromjson(element));
        }
      }

      return right(notificationsList.reversed.toList());
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future readnot(String token, int id) async {
    await api_services.putservice('/notifications/mark/$id', {}, token);
  }

  Future deletenot(String token, int id) async {
    await api_services.deleteservice('/notifications/$id/', {}, token);
  }

  @override
  Future<Either<Failure, BCi>> getBci(String token, int bciid) async {
    try {
      var response = await api_services.getservice(
          '/consom/bondecommandeinterne/rud/${bciid}/', token);
      return right(BCi.fromjson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(servicefailure.dioerror(e));
      } else {
        return left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, int>>> getstatistics(
      String token, String consid) async {
    Map<String, int> statisctics = {
      'Created succesfully': 0,
      'Validated by the responsable': 0,
      'Validated by the director': 0,
      'Delivered': 0,
     

    };

    try {
      
      var response = await api_services.getservice(
          '/consom/bondecommandeinterne/listcreate/', token);

      for (var element in response.data) {
        if (element['user_id'].toString() == consid) {
          statisctics.update(element['status'], (value) => value + 1);
        }
      }
print(statisctics);
      return right(statisctics);
    } catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  
}
