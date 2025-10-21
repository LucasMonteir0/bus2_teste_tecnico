import '../../../core/wrappers/result_wrapper.dart';
import '../../models/user/user_model.dart';

abstract class RandomUserRepository {
  Future<ResultWrapper<UserModel>> fetchRandomUser();
}
