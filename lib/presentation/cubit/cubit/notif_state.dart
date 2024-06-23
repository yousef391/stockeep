part of 'notif_cubit.dart';

@immutable
sealed class NotifState {}

final class NotifInitial extends NotifState {}
final class NotifLoading extends NotifState {}
final class NotifSucces extends NotifState {
  List notiflist=[];
  NotifSucces(this.notiflist);
}
final class Notifread extends NotifState {
}
final class NotifFailure extends NotifState {
  String message;
  NotifFailure(this.message);
}
