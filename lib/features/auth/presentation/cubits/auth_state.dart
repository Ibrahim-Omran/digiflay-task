part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangeLoginPasswordSuffixIcon extends AuthState {}
final class ChangeRememberIcon extends AuthState {}

final class LoginLoadingState extends AuthState{}
final class LoginSuccessState extends AuthState{}
final class LoginErrorState extends AuthState{
  final String message ;
  LoginErrorState(this.message);
}

final class SignUpLoadingState extends AuthState{}
final class SignUpSuccessState extends AuthState{}
final class SignUpErrorState extends AuthState{
  final String message ;
  SignUpErrorState(this.message);
}

