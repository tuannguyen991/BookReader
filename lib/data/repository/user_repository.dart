import 'package:demo_book_reader/models/user/user_model.dart';

abstract class UserRepository {
  /// Get ID User
  Future<String> login({required String username, required String password});

  /// Get Information User [UserModel]
  Future<UserModel> getInfor({required String token});

  /// Register Reading Package [UserModel]
  Future<UserModel> registerReadingPackage(
      {required String token,
      required String readingPackageId,
      required DateTime startDate});
}
