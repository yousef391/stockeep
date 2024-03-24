

class UserM {
   UserM({required this.id , required this.email , required this.first_name ,required this.last_name ,required this.username ,}) ;
  int id;
  String first_name;
  String last_name;
  String email;
  String username;
  late String _token;

  String get token => _token;
 
 set token(String value) {
 if (value.isNotEmpty) {
 _token = value;
 }
 }

  factory UserM.fromjson(Map<String,dynamic>  json) {
    return UserM(id: json['id'], email: json['email'], first_name: json['first_name'], last_name: json['last_name'], username: json['username'],);
  }

}