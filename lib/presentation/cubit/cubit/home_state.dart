part of 'home_cubit.dart';

@immutable
sealed class GetchapitreState {}

final class GetchapitreInitial extends GetchapitreState {}
 class GetchapitreSuccess extends GetchapitreState  {
 final Map<String,int> chaplist;
 GetchapitreSuccess(this.chaplist);
}
 class GetchapitreFailure extends GetchapitreState {
  final String message;
  GetchapitreFailure(this.message);
}
final class Getchapitreloading extends GetchapitreState {}
