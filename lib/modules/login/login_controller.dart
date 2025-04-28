import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_repository.dart';

class LoginController {
  final LoginRepository repository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController(this.repository);

  void login(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final success = await repository.login(email, password, context);

  }

   Future <void> register( BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    await repository.register(email, password, context);
  }
}
