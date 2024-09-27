import 'dart:developer';

import 'package:blocdemo/auth/auth_bloc.dart';
import 'package:blocdemo/home_screen.dart';
import 'package:blocdemo/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        log('listener state: ${state.toString()}');
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen(name: state.name);
        } else if (state is Unauthenticated) {
          return const LoginScreen();
        }
        return const Center(
          child: Text('Error...'),
        );
      },
    );
  }
}
