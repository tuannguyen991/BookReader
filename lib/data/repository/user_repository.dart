import '../../models/user_model.dart';

abstract class UserRepository {
  /// Call to get [UserModel]
  Future<UserModel> getUserInfo(String id);
}
