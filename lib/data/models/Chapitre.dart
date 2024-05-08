

class Chapitre {
  Chapitre({required this.libelle , required this.id}) ;
  String libelle ;
  int id;
  factory Chapitre.fromjson(Map<String,dynamic> json) {
return Chapitre(libelle: json['libelle'] , id : json['id']);
  }


}