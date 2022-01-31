import 'package:flutter/material.dart';
import 'package:zeusapp/pages/home_pages.dart';
import 'package:zeusapp/pages/login_pages.dart';
import 'package:zeusapp/pages/usuarios_pages.dart';

Map<String, WidgetBuilder> getDefaultApplicationRouter() {
  return <String, WidgetBuilder>{
    'home': (context) => HomePage(),
    'login': (context) => LoginPage(),
    'usuario': (context) => UsuarioPage(),
  };
}
