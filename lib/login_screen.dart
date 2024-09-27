import 'dart:developer';

import 'package:blocdemo/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Pass',
            ),
          ),
          TextButton(
            onPressed: () {
              log('Username: ${_usernameController.text}');
              log('Password: ${_passwordController.text}');
              context.read<AuthBloc>().add(LoginEvent(
                    username: _usernameController.text,
                    pass: _passwordController.text,
                  ));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
