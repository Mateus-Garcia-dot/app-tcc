// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:app_tcc/screens/commom/confirmation_dialog.dart';
import 'package:app_tcc/screens/commom/exception_dialog.dart';
import 'package:app_tcc/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/logo/logo.png',
                          fit: BoxFit.fill)),
                  const Text("Entre ou Registre-se",
                      style: TextStyle(fontSize: 18)),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          tryLogin(context);
                        },
                        child: const Text("Continuar")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void tryLogin(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    authService.login(email, password).then((token) {
      Navigator.pushReplacementNamed(context, 'home');
    }).catchError((e) {
      showConfirmationDialog(
        context,
        title: "Usuário ainda não existe",
        content: "Deseja criar um novo usuário com email $email?",
        affirmativeOption: "Criar",
      ).then(
        (value) async {
          if (value) {
            authService.register(email, password).then((token) {
              Navigator.pushReplacementNamed(context, 'home');
            });
          }
        },
      );
    }, test: (e) => e is UserNotFoundException).catchError((e) {
      HttpException exception = e as HttpException;
      showExceptionDialog(context, content: exception.message);
    }, test: (e) => e is HttpException);
  }
}
