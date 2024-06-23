



class Notif {
  Notif({required this.message , required this.title ,required this.read_status , required this.time , required this.id }) ;
  int id;
  String message ;
  String title;
  var read_status;
  String time;


  factory Notif.fromjson(var data){
return Notif(message: data['message'], title: data['titre'], read_status: data['read_status'], time: data['timestamp'] , id:data['id'] );
  }


}