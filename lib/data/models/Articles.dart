



class Article {
  Article({required this.designation , required this.chapitre , required this.tva , required this.id}) ;
int id;
  String designation;
  String chapitre;
  String tva;
  
  
  factory Article.fromjson(Map json) {
return Article(designation: json['designation']  , chapitre: json['chapitre'] ,tva: json['tva'] ,id: json['id']   );
  }


}