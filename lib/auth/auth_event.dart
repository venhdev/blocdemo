// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String pass;

  LoginEvent({
    required this.username,
    required this.pass,
  });
}

class LogoutEvent extends AuthEvent {
  LogoutEvent();
}
