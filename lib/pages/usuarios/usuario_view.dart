import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:zeusapp/models/usuario_models.dart';
import 'package:zeusapp/services/usuario_service.dart';
import 'package:zeusapp/services/utils.dart';

class UsuarioList extends StatelessWidget {
  final service = UsuarioService();
  List<Usuario> usuarios = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.findUsers(),
      builder: _listBuilder,
    );
  }
}

Widget _listBuilder(
    context, AsyncSnapshot<ApiResponse<List<Usuario>>> snapshot) {
  if (snapshot.hasData) {
    return ListView(
      children: () {
        List<Widget> children = [];
        if (snapshot.data == null) {
          return [const Text('no hay datos')];
        }
        if (snapshot.data!.hasError()) {
          Alert(message: snapshot.data?.message ?? 'algo paso').show();
          return [const Text('hubo un porblema')];
        }
        for (Usuario u in snapshot.data?.data ?? []) {
          children.add(_itemList(u));
        }
        return children;
      }(),
    );
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}

Widget _itemList(Usuario u) {
  return ListTile(
    leading: const Icon(Icons.person),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(u.username ?? 'none'),
        Text((u.state ?? false) ? 'Activo' : 'Inactivo',
            style: const TextStyle(
              fontSize: 11.0,
              color: Color.fromARGB(90, 0, 0, 0),
            ))
      ],
    ),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Fecha de creacion:'),
        const SizedBox(width: 10.0),
        Text(u.createdAt?.toLocal().toString().substring(0, 10) ?? ''),
      ],
    ),
  );
}
