import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stockeep/data/models/Product.dart';

part 'addproduct_state.dart';

class AddproductCubit extends Cubit<AddproductState> {
  AddproductCubit() : super(AddproductInitial());
List<Product> CardItems=[];

void addproduct(Product product){
if (product.qnt<=0) {

  product.qnt++;
  CardItems.add(product);
  
  
   } 
else {
    
 var pos= CardItems.indexOf(product);
product.qnt++ ;
CardItems[pos]=product;

print(product.qnt);
}
emit(Addingstate());


}

void removeproduct(Product product){
if (product.qnt==1) {
  product.qnt-- ;
  CardItems.remove(product); 
} else {
  var pos= CardItems.indexOf(product);
product.qnt-- ;
CardItems[pos]=product;
print(product.qnt);
}
emit(removingstate());
}

void removeallproducts(Product product){

  CardItems.remove(product);



emit(removingstate());
}


}
