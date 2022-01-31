import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeusapp/pages/login_pages.dart';
import 'package:zeusapp/router/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: _checkRoute(),
      routes: getDefaultApplicationRouter(),
    );
  }
}

String _checkRoute() {
  var token = GetStorage().read<String>('token');
  if (token != null) {
    return 'home';
  }
  return 'login';
}

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
