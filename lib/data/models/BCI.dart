
import 'package:stockeep/data/models/BCIitem.dart';


class BCi {
  BCi({required this.consomid , required this.date , this.id , required this.status , required this.type , required this.items});
  int? id;
  int consomid;
  var status;
  var type;
  var date;
  List<BCiitem> items=[];
  




  factory BCi.fromjson (var json){
    List<BCiitem> itemss=[];
   json['items'].forEach((element) {
     itemss.add(BCiitem.fromjson(element));
   },);
   
  
return BCi(consomid: json['Consommateur_id'], date: json['date'], id: json['id'], status: json['status'], type: json['type'] , items: itemss );
  }


  Map tojson() { 
    List jsonitems= [];
    
    items!.forEach((element) {
      
      jsonitems.add(element.tojson());
    });
    return
    {
    "Consommateur_id": consomid,
    "status" : status.toString(),
    "type" : type.toString(),
    "date" : date.toString() ,
    "items" :  jsonitems
  } ; }

}