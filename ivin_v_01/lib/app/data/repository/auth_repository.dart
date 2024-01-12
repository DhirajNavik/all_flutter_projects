import 'package:ivin_v_01/app/data/model/dto/RepoResponse.dart';
import 'package:ivin_v_01/app/data/model/request/login_request.dart';
import 'package:ivin_v_01/app/data/model/response/generic_response.dart';
import 'package:ivin_v_01/app/data/values/urls.dart';
import 'package:ivin_v_01/base/base_repository.dart';
import 'package:ivin_v_01/utils/helper/exception_handler.dart';

class AuthRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> login(LoginRequest data) async {
    final response =
        await controller.post(path: URLs.login, data: data.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
