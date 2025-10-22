import '../../../core/clients/database/database_client.dart';
import '../../../core/wrappers/result_wrapper.dart';
import '../../models/user/user_model.dart';
import 'database_users_repository.dart';

class DatabaseUsersRepositoryImpl implements DatabaseUsersRepository {
  final DatabaseClient client;

  DatabaseUsersRepositoryImpl(this.client);

  @override
  Future<ResultWrapper<bool>> clearUsers() {
    return client.clearUsers();
  }

  @override
  Future<ResultWrapper<List<UserModel>>> fetchUsers() {
    return client.getAllUsers();
  }

  @override
  Future<ResultWrapper<bool>> saveUser(UserModel user) {
    return client.saveUser(user);
  }
}
