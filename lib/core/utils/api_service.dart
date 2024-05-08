
import 'package:dio/dio.dart';



class Api_services {
  
final String _baseURl='http://127.0.0.1:8000';
final Dio dio ;

  Api_services({required Dio dio}) : dio = dio;

  Future<Response> getservice( String endpoint , String token) async {
    var response = await dio.get('$_baseURl$endpoint' , options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer $token",
          }));

        
          
     return response;
  }

  Future<Response> postservice(String endpoint , var data ) async {
    var response = await dio.post('$_baseURl$endpoint' , data: data  );
      return response;
  }
   

}