import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeusapp/models/login_models.dart';

import 'package:zeusapp/router/form_inputs.dart';
import 'package:zeusapp/services/login_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  LoginService service = LoginService();
  void handlerLogin() async {
    var l = Login(username: _username, password: _password);
    final res = await service.loggin(l);
    if (res.error) {
      Alert(message: res.message).show();
      return;
    }
    Alert(message: "bienvenido").show();
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Bienvenido',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(90, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 40.0),
          Input(
            hintText: 'Nombre de usuario',
            title: 'Username',
            onChangeValue: (value) => {_username = value},
          ),
          const SizedBox(height: 10.0),
          Input(
            isPassword: true,
            title: 'Password',
            hintText: '***************',
            onChangeValue: (value) => {_password = value},
          ),
          const SizedBox(height: 10.0),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: handlerLogin,
            child: const Text(
              'Iniciar Session',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    ));
  }
}
