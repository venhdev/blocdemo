import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    final String username = event.username;
    final String pass = event.pass;

    // https://66f66fca436827ced9772078.mockapi.io/auth/User
    // https://66f66fca436827ced9772078.mockapi.io/auth/User?username=Bryon.Beatty59&password=8CmdW9mEOHG0iJ5

    final response = await http.get(
      Uri.parse('https://66f66fca436827ced9772078.mockapi.io/auth/User?username=$username&password=$pass'),
    );

    log('response.statusCode: ${response.statusCode}');
    log('response.body: ${response.body}');

    if (response.statusCode == 200) {
      emit(Authenticated(username));
    } else {
      emit(Unauthenticated());
    }
  }

  void _onLogout (LogoutEvent event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
