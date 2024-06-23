part of 'addproduct_cubit.dart';

@immutable
sealed class AddproductState {}

final class AddproductInitial extends AddproductState {}
final class Addingstate extends AddproductState {


}
final class removingstate extends AddproductState {
}
final class voidcardstate extends AddproductState {
}
