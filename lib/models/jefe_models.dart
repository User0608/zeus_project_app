// To parse this JSON data, do
//
//     final primerJefe = primerJefeFromMap(jsonString);

import 'dart:convert';

class Jefe {
  Jefe({
    this.dni,
    this.nombre,
    this.apPaterno,
    this.apMaterno,
    this.direccion,
    this.tel,
    this.email,
    this.fechaNacimiento,
    this.nivelEstudio,
    this.estadoCivil,
  });

  String? dni;
  String? nombre;
  String? apPaterno;
  String? apMaterno;
  String? direccion;
  String? tel;
  String? email;
  DateTime? fechaNacimiento;
  int? nivelEstudio;
  int? estadoCivil;

  factory Jefe.fromJson(String str) => Jefe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jefe.fromMap(Map<String, dynamic> json) => Jefe(
        dni: json["dni"],
        nombre: json["nombre"],
        apPaterno: json["ap_paterno"],
        apMaterno: json["ap_materno"],
        direccion: json["direccion"],
        tel: json["tel"],
        email: json["email"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        nivelEstudio: json["nivel_estudio"],
        estadoCivil: json["estado_civil"],
      );

  Map<String, dynamic> toMap() => {
        "dni": dni,
        "nombre": nombre,
        "ap_paterno": apPaterno,
        "ap_materno": apMaterno,
        "direccion": direccion,
        "tel": tel,
        "email": email,
        "fecha_nacimiento": fechaNacimiento?.toIso8601String(),
        "nivel_estudio": nivelEstudio,
        "estado_civil": estadoCivil,
      };
}

class Instructor {
  Instructor({
    this.dni,
    this.nombre,
    this.apPaterno,
    this.apMaterno,
    this.direccion,
    this.tel,
    this.email,
    this.fechaNacimiento,
    this.nivelEstudio,
    this.estadoCivil,
    this.state,
    this.detalle,
  });

  String? dni;
  String? nombre;
  String? apPaterno;
  String? apMaterno;
  String? direccion;
  String? tel;
  String? email;
  DateTime? fechaNacimiento;
  int? nivelEstudio;
  int? estadoCivil;
  bool? state;
  String? detalle;

  factory Instructor.fromJson(String str) =>
      Instructor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Instructor.fromMap(Map<String, dynamic> json) => Instructor(
        dni: json["dni"],
        nombre: json["nombre"],
        apPaterno: json["ap_paterno"],
        apMaterno: json["ap_materno"],
        direccion: json["direccion"],
        tel: json["tel"],
        email: json["email"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        nivelEstudio: json["nivel_estudio"],
        estadoCivil: json["estado_civil"],
        state: json["state"],
        detalle: json["detalle"],
      );

  Map<String, dynamic> toMap() => {
        "dni": dni,
        "nombre": nombre,
        "ap_paterno": apPaterno,
        "ap_materno": apMaterno,
        "direccion": direccion,
        "tel": tel,
        "email": email,
        "fecha_nacimiento": fechaNacimiento?.toIso8601String(),
        "nivel_estudio": nivelEstudio,
        "estado_civil": estadoCivil,
        "state": state,
        "detalle": detalle,
      };
}
