import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Option(
            title: 'Usuarios',
            icon: Icons.people,
            onTap: () {
              Navigator.pushNamed(context, 'usuario');
            },
          ),
          Option(title: 'Educacion', icon: Icons.book),
          Option(title: 'Cronogramas', icon: Icons.calendar_today),
          Option(title: 'Reportes', icon: Icons.grade),
        ],
      ),
    );
  }
}

Widget Option({String title = "", IconData? icon, void Function()? onTap}) {
  return ListTile(
    title: Text(title),
    leading: Icon(
      icon ?? Icons.design_services,
      color: Colors.lightBlue,
    ),
    trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.amber),
    onTap: onTap,
  );
}
