import 'package:demo_book_reader/models/user/create_user/create_user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';

import '../../models/user/update_user/update_user_model.dart';

abstract class UserRepository {
  /// Get Information User [UserModel]
  Future<UserModel> getInfor({required String token});

  /// Get Information User with current package[UserModel]
  Future<UserModel> getInforWithCurrentPackage({required String token});

  /// Register Reading Package [UserModel]
  Future<UserModel> registerReadingPackage({
    required String token,
    required String readingPackageId,
    required DateTime startDate,
  });

  Future<void> createUser({required CreateUserModel user});

  Future<void> updateUser(
      {required String token, required UpdateUserModel user});

  Future<void> uploadImage({required String userId, required String path});
}
