import 'package:zeusapp/models/jefe_models.dart';
import 'package:zeusapp/services/utils.dart';

class PersonaService {
  Future<ApiResponse<Jefe>> findPrimerJefe() async {
    final res = await fetchGet('/persona/primerjefe');
    if (res.err()) {
      return ApiResponse(error: res.err(), message: res.getMesage());
    }
    return ApiResponse(data: Jefe.fromMap(res.data));
  }

  Future<ApiResponse<Jefe>> findPrimerSegundoJefe() async {
    final res = await fetchGet('/persona/segundojefe');
    if (res.err()) {
      return ApiResponse(error: res.err(), message: res.getMesage());
    }
    return ApiResponse(data: Jefe.fromMap(res.data));
  }

  Future<ApiResponse<Instructor>> findJefeDeInstruccion() async {
    final res = await fetchGet('/persona/jefeinstruccion');
    if (res.err()) {
      return ApiResponse(error: res.err(), message: res.getMesage());
    }
    return ApiResponse(data: Instructor.fromMap(res.data));
  }

  Future<ApiResponse<List<Instructor>>> findInstructores() async {
    final res = await fetchGet('/persona/instructor');
    if (res.err()) {
      return ApiResponse(error: res.err(), message: res.getMesage());
    }
    List<Instructor> instructores = [];
    for (var json in res.data) {
      instructores.add(Instructor.fromMap(json));
    }
    return ApiResponse(data: instructores);
  }
}
