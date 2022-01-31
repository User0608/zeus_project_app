import 'dart:convert';

class Login {
  Login({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}

class LogginResponse {
  LogginResponse({
    this.token,
    this.data,
  });

  String? token;
  Data? data;

  factory LogginResponse.fromJson(String str) =>
      LogginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LogginResponse.fromMap(Map<String, dynamic> json) => LogginResponse(
        token: json["token"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "data": data?.toMap(),
      };
}

class Data {
  Data({
    this.username,
    this.password,
    this.owner,
    this.state,
    this.createdAt,
  });

  String? username;
  String? password;
  String? owner;
  bool? state;
  DateTime? createdAt;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        username: json["username"],
        password: json["password"],
        owner: json["owner"],
        state: json["state"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
        "owner": owner,
        "state": state,
        "created_at": createdAt?.toIso8601String(),
      };
}
