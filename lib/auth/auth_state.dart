part of 'auth_bloc.dart';

class AuthState {}

final class Unauthenticated extends AuthState {}

final class Authenticated extends AuthState {
  final String name;

  Authenticated(this.name);
}
