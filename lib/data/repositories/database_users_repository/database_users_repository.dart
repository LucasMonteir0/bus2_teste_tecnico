import 'package:bus2_teste_tecnico/core/wrappers/result_wrapper.dart';

import '../../models/user/user_model.dart';

abstract class DatabaseUsersRepository {
  Future<ResultWrapper<bool>> saveUser(UserModel user);

  Future<ResultWrapper<List<UserModel>>> fetchUsers();

  Future<ResultWrapper<bool>> clearUsers();
}
