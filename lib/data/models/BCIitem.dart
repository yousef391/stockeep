class BCiitem {
  BCiitem ({this.id , required this.qntaccorde , required this.qntcommande , required this.name});
  int? id ;
  var name;
  var qntcommande;
  var qntaccorde;
  factory BCiitem.fromjson(var json) {
    return BCiitem(id: json['id'], qntaccorde: json['quantite_accorde'], qntcommande: json['quantite_demandee'] , name: json['produit']);
  }

  Map tojson()=> {
    
    "quantite_demandee" : qntcommande ,
    "quantite_accorde" : qntaccorde,
    "produit" :name
  } ;
}