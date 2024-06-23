part of 'get_bcis_cubit.dart';

@immutable
sealed class GetBcisState {}

final class GetBcisInitial extends GetBcisState {}
final class GEtBcisSucces extends GetBcisState{
final List<BCi> bcis;
 GEtBcisSucces(this.bcis);
}
final class GEtBcisloading extends GetBcisState{}
final class GEtBcisfailure extends GetBcisState{
   final String message;
 GEtBcisfailure(this.message);
}





final class Deletebciloading extends GetBcisState{}
final class Deletebcifailure extends GetBcisState{

}
