class Product {
  Product({required this.designation , required this.articles , this.qnt=0 , this.qntinstock=0  , required this.id}) ;
  int id;
  String designation ;
  List articles ; 
  int qnt;
  int? qntinstock;
 
  
  factory Product.fromjson(Map json) {
return Product(designation: json['designation'] , articles:json['articles'] , id: json['id'] );
  }


}