import 'dart:convert';
import 'package:dio/dio.dart';


class Api_services {
  
final String _baseURl='http://127.0.0.1:8000';
final Dio dio ;

  Api_services({required Dio dio}) : dio = dio;

  Future<Map<String,dynamic>> getservice( String endpoint) async {
    var response = await dio.get('$_baseURl$endpoint');
     return response.data;
  }

  Future<Map<String,dynamic>> postservice(String endpoint , Map data ) async {
    var response = await dio.post('$_baseURl$endpoint' , data:{
    "email": data['email'] ,
    "password": data['password']
});
    return response.data;
  }
   

}