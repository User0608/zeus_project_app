import 'package:flutter/material.dart';
import 'package:zeusapp/router/form_inputs.dart';

class RegistrarUsuarioView extends StatelessWidget {
  String _username = '';
  String _password = '';
  String _confirm_password = '';
  void createUser() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Input(
          title: 'Username',
          hintText: 'Ingrese nombre de usuario',
          onChangeValue: (value) => {_username = value},
        ),
        Input(
          isPassword: true,
          title: 'Password',
          hintText: 'Ingrese contraseña',
          onChangeValue: (value) => {_password = value},
        ),
        Input(
          isPassword: true,
          title: 'Password',
          hintText: 'Confirme su contraseña',
          onChangeValue: (value) => {_confirm_password = value},
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {},
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: createUser,
              child: const Text(
                'Crear Usuario',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )
      ],
    );
  }
}
