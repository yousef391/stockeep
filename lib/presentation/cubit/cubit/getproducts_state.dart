part of 'getproducts_cubit.dart';

@immutable
sealed class GetproductsState {}

final class GetproductsInitial extends GetproductsState {}
 class GetproductsSuccess extends GetproductsState  {
 final List<Product> productslist;
 GetproductsSuccess(this.productslist);
}
 class GetproductsFailure extends GetproductsState {
  final String message;
  GetproductsFailure(this.message);
}
final class Getproductsloading extends GetproductsState {}