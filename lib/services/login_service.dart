import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:zeusapp/models/login_models.dart' as models;
import 'package:http/http.dart' as http;
import 'package:zeusapp/services/utils.dart';

class LoginService {
  final path = 'login';
  final client = http.Client();
  Future<ApiResponse<models.Data>> loggin(models.Login login) async {
    final box = GetStorage();
    ApiResponse<models.Data> response = ApiResponse();
    try {
      final res = await client.post(
        buildUrl(path),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(login.toMap()),
      );
      if (res.statusCode != 200) {
        final decoded = json.decode(res.body);
        response.error = true;
        response.message = decoded['message'];
      } else {
        final usuario = models.LogginResponse.fromJson(res.body);
        box.write('token', usuario.token);
        response.data = usuario.data;
      }
    } catch (e) {
      print(e);
      response.error = true;
      response.message =
          'Verifique su conexión, no se pudo realizar la operación';
    }
    return response;
  }
}
