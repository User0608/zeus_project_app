import 'package:zeusapp/models/usuario_models.dart';
import 'package:zeusapp/services/utils.dart';

class UsuarioService {
  Future<ApiResponse<List<Usuario>>> findUsers() async {
    final res = await fetchGet('/usuario');
    if (res.err()) {
      return ApiResponse(error: res.err(), message: res.getMesage());
    }
    List<Usuario> usuarios = [];
    for (var json in res.data) {
      usuarios.add(Usuario.fromMap(json));
    }
    return ApiResponse(data: usuarios);
  }
}
