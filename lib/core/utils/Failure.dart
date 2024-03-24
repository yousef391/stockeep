import 'package:dio/dio.dart';
class Failure {
  final String message;
  const Failure(this.message);
}



class servicefailure extends Failure{
servicefailure(super.message);



factory servicefailure.dioerror(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      return servicefailure('connectionTimeout error');
    case DioExceptionType.sendTimeout:
      return servicefailure('sendTimeout error');
    case DioExceptionType.receiveTimeout:
      return servicefailure('receiveTimeout error');
    case DioExceptionType.badCertificate:
      return servicefailure('badCertificate error');
    case DioExceptionType.badResponse:
      return servicefailure.responseerror(
          dioException.response!.statusCode!, dioException.response!);
    case DioExceptionType.cancel:
      return servicefailure('cancel error');
    case DioExceptionType.connectionError:
      return servicefailure('connection error');
    case DioExceptionType.unknown:
      return servicefailure('oopps error try again !');
    default:
      return servicefailure('opps error try again !');
  }
}

factory servicefailure.responseerror (int statuscode,dynamic response){
  if(statuscode==400 || statuscode==401 || statuscode == 403) {
return servicefailure(response.data['message']);
  } else if(statuscode==404){
    return servicefailure('your request not found try later');
  } else if(statuscode==500) {
return servicefailure('internet server error');
  } else {
    return servicefailure('oops there was an error , try later!');
  }
  
}
}