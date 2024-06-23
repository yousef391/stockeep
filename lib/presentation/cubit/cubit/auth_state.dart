part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
 class AuthLoginSuccess extends AuthState {
  final UserM user;
 AuthLoginSuccess(this.user);
}
 class AuthLoginFailure extends AuthState {
  final String message;
  AuthLoginFailure(this.message);
}
final class AuthLoginloading extends AuthState {}

 class ChangepassSuccess extends AuthState {
  final String message;
 ChangepassSuccess(this.message);
}
 class ChangepassFailure extends AuthState {
  final String message;
  ChangepassFailure(this.message);
}
final class Changepassloading extends AuthState {}

