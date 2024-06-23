part of 'get_stati_cubit.dart';

@immutable
sealed class GetStatiState {}

final class GetStatiInitial extends GetStatiState {}
final class GetStatisucces extends GetStatiState {
  GetStatisucces(this.stati);
  Map<String,int> stati;
}
final class GetStatiFailure extends GetStatiState {
  GetStatiFailure(this.message);
  String message;
}
final class GetStatiloading extends GetStatiState {}
