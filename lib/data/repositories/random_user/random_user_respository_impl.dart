import 'package:bus2_teste_tecnico/core/clients/http/app_http_client.dart';
import 'package:bus2_teste_tecnico/core/urls.dart';
import 'package:bus2_teste_tecnico/core/wrappers/result_wrapper.dart';
import 'package:bus2_teste_tecnico/data/models/user/user_model.dart';

import 'random_user_repository.dart';

class RandomUserRepositoryImpl implements RandomUserRepository {
  final AppHttpClient _http;

  RandomUserRepositoryImpl(this._http);

  @override
  Future<ResultWrapper<UserModel>> fetchRandomUser() async {
    return _http.get(
      Urls.baseUrl,
      onResult: (data) => UserModel.fromJson(data["results"][0]),
    );
  }
}
