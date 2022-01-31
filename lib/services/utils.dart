import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

const apiurl = '192.16.0.10:90';

class ApiResponse<T> {
  bool error;
  String message;
  T? data;
  ApiResponse({
    this.error = false,
    this.message = "Operación exitosa",
    this.data,
  });
  bool hasError() {
    return error;
  }

  T? getData() {
    return data;
  }
}

Uri buildUrl(String path) {
  path = path.trim();
  if (path.isNotEmpty) {
    if (path[0] == "/") {
      path = path.substring(1);
    }
  }
  var url = Uri.http(apiurl, path);
  return url;
}

class FetchResponse {
  bool _error = false;
  String _message = '';
  dynamic data = {};
  String getMesage() {
    return _message;
  }

  bool err() {
    return _error;
  }
}

Future<FetchResponse> fetchGet(String path) async {
  var response = FetchResponse();
  try {
    final res = await http.get(
      buildUrl(path),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': GetStorage().read<String>('token') ?? '',
      },
    );
    final decoded = json.decode(res.body);
    if (res.statusCode != 200) {
      response._error = true;
      response._message = decoded['message'];
    } else {
      response.data = decoded['data'];
    }
  } catch (e) {
    response._error = true;
    response._message =
        'Verifique su conexión, no se pudo realizar la operación';
  }
  return response;
}
