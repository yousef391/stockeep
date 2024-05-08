part of 'addbci_cubit.dart';

@immutable
sealed class AddbciState {}

final class AddbciInitial extends AddbciState {}

final class AddbciSucces extends AddbciState{

}
final class Addbciloading extends AddbciState{}
final class Addbcifailure extends AddbciState{
   final String message;
 Addbcifailure(this.message);
}