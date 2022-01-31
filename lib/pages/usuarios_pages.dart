import 'package:flutter/material.dart';
import 'package:zeusapp/pages/usuarios/entidades_view.dart';
import 'package:zeusapp/pages/usuarios/registro_view.dart';
import 'package:zeusapp/pages/usuarios/usuario_view.dart';

class UsuarioPage extends StatefulWidget {
  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  int _viewSelect = 0;

  void handlerBarButtons(int index) {
    setState(() {
      _viewSelect = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: _viewload(_viewSelect),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 18.0,
        selectedItemColor: Colors.red,
        currentIndex: _viewSelect,
        onTap: handlerBarButtons,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.looks),
            label: 'Ver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Registrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Resumen',
          ),
        ],
      ),
    );
  }
}

Widget _viewload(int index) {
  switch (index) {
    case 0:
      return UsuarioList();
    case 1:
      return RegistrarUsuarioView();
    case 2:
      return EntidadesView();
    default:
      return UsuarioList();
  }
}
