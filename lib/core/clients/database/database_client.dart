import '../../../data/models/user/user_model.dart';
import '../../wrappers/result_wrapper.dart';

abstract class DatabaseClient {
  Future<void> init();

  Future<ResultWrapper<bool>> saveUser(UserModel user);

  Future<ResultWrapper<List<UserModel>>> getAllUsers();

  Future<ResultWrapper<bool>> clearUsers();
}
