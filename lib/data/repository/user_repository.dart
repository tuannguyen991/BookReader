import 'package:demo_book_reader/models/user/user_model.dart';

abstract class UserRepository {
  /// Call to get [UserModel]
  Future<String> login({required String username, required String password});

  Future<UserModel> getInfor({required String token});
}
 