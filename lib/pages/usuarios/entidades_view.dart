import 'package:flutter/material.dart';
import 'package:zeusapp/models/jefe_models.dart';
import 'package:zeusapp/services/persona_service.dart';
import 'package:zeusapp/services/utils.dart';

class EntidadesView extends StatelessWidget {
  final service = PersonaService();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(6.0),
      shrinkWrap: true,
      children: [
        const Text('  Primer Jefe',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0)),
        _primerjefe(service),
        const Divider(),
        const Text('  Segundo Jefe',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0)),
        _segundojefe(service),
        const Divider(),
        const Text('  Jefe de instruccion',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0)),
        _jefeInstruccion(service),
        const Divider(),
        const Divider(),
        const Divider(),
        const Divider(),
        const Text('Instructores',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0)),
        SizedBox(
          height: 500,
          child: _jefesdeInstruccion(service),
        )
      ],
    );
  }
}

Widget _primerjefe(PersonaService service) {
  return FutureBuilder(
    future: service.findPrimerJefe(),
    builder: _jefeBuilder,
  );
}

Widget _segundojefe(PersonaService service) {
  return FutureBuilder(
    future: service.findPrimerSegundoJefe(),
    builder: _jefeBuilder,
  );
}

Widget _jefeBuilder(context, AsyncSnapshot<ApiResponse<Jefe>> snapshot) {
  if (snapshot.hasData) {
    final jefe = snapshot.data?.data;
    if (jefe == null) {
      return const Text('no hay datos');
    }
    return _card(jefe);
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}

Widget _jefeInstruccion(PersonaService service) {
  return FutureBuilder(
    future: service.findJefeDeInstruccion(),
    builder: _instructorBuilder,
  );
}

Widget _instructorBuilder(
    context, AsyncSnapshot<ApiResponse<Instructor>> snapshot) {
  if (snapshot.hasData) {
    final instructor = snapshot.data?.data;
    if (instructor == null) {
      return const Text('no hay datos');
    }
    return _card(Jefe(
      dni: instructor.dni,
      nombre: instructor.nombre,
      apMaterno: instructor.apMaterno,
      apPaterno: instructor.apPaterno,
      direccion: instructor.direccion,
      tel: instructor.tel,
      email: instructor.email,
      fechaNacimiento: instructor.fechaNacimiento,
    ));
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}

Widget _jefesdeInstruccion(PersonaService service) {
  return FutureBuilder(
    future: service.findInstructores(),
    builder: _instructoresBuilder,
  );
}

Widget _instructoresBuilder(
    context, AsyncSnapshot<ApiResponse<List<Instructor>>> snapshot) {
  if (snapshot.hasData) {
    final instructores = snapshot.data?.data;
    if (instructores == null) {
      return const Text('no hay datos');
    }
    List<Widget> cards = [];
    for (Instructor i in instructores) {
      cards.add(_card(Jefe(
        dni: i.dni,
        nombre: i.nombre,
        apMaterno: i.apMaterno,
        apPaterno: i.apPaterno,
        direccion: i.direccion,
        tel: i.tel,
        email: i.email,
        fechaNacimiento: i.fechaNacimiento,
      )));
    }
    return ListView(children: cards);
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}

Widget _card(Jefe jefe) {
  return Card(
    elevation: 3,
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${jefe.nombre} ${jefe.apPaterno} ${jefe.apMaterno}',
            style: const TextStyle(fontSize: 19),
          ),
          Text(
            jefe.dni ?? '',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(95, 0, 0, 0),
            ),
          )
        ],
      ),
      subtitle: Container(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Dirección:'),
                const SizedBox(width: 10.0),
                Text(
                  jefe.direccion ?? '',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(95, 0, 0, 0)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Teléfono:'),
                const SizedBox(width: 10.0),
                Text(
                  jefe.tel ?? '',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(95, 0, 0, 0)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Email:'),
                const SizedBox(width: 10.0),
                Text(
                  jefe.email ?? '',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(95, 0, 0, 0)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Fecha Nacimiento:'),
                const SizedBox(width: 10.0),
                Text(
                  jefe.fechaNacimiento?.toLocal().toString().substring(0, 10) ??
                      '',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(95, 0, 0, 0)),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
