// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:app_tcc/screens/commom/confirmation_dialog.dart';
import 'package:app_tcc/screens/commom/exception_dialog.dart';
import 'package:app_tcc/services/auth_service.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  CadastroScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

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
                  const Text("Criar conta", style: TextStyle(fontSize: 24)),
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(label: Text("Nome")),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _telefoneController,
                    decoration: const InputDecoration(label: Text("Telefone")),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(label: Text("E-mail")),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  TextFormField(
                    controller: _cpfController,
                    decoration: const InputDecoration(label: Text("CPF")),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          cadastrar(context);
                        },
                        child: const Text("Cadastrar")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void cadastrar(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
    String cpf = _cpfController.text;
    String telefone = _telefoneController.text;
    String nome = _nomeController.text;

    authService.cadastrar(email, password, cpf, telefone, nome).then((token) {
      Navigator.pushReplacementNamed(context, 'home');
    }).catchError((e) {

    }, test: (e) => e is UserNotFoundException).catchError((e) {
      HttpException exception = e as HttpException;
      showExceptionDialog(context, content: exception.message);
    }, test: (e) => e is HttpException);
  }
}
