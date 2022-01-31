import 'dart:convert';

class Usuario {
  Usuario({
    this.username,
    this.owner,
    this.state,
    this.createdAt,
  });

  String? username;
  String? owner;
  bool? state;
  DateTime? createdAt;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        username: json["username"],
        owner: json["owner"],
        state: json["state"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "owner": owner,
        "state": state,
        "created_at": createdAt?.toIso8601String(),
      };
}
