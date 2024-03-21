part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
 class AuthLoginSuccess extends AuthState {
  final String token;
 AuthLoginSuccess(this.token);
}
 class AuthLoginFailure extends AuthState {
  final String message;
  AuthLoginFailure(this.message);
}
final class AuthLoginloading extends AuthState {}
