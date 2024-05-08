part of 'getarticles_cubit.dart';

@immutable
sealed class GetarticlesState {}

final class GetarticlesInitial extends GetarticlesState {}
 class GetarticlesSuccess extends GetarticlesState  {
 final Map<int,Article> articleslist;
 GetarticlesSuccess(this.articleslist);
}
 class GetarticlesFailure extends GetarticlesState {
  final String message;
  GetarticlesFailure(this.message);
}
final class Getarticlesloading extends GetarticlesState {}
