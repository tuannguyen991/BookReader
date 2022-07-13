import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user_model.dart';

class UserRepositoryFake implements UserRepository {
  @override
  Future<UserModel> getUserInfo(String id) async {
    return const UserModel(
        name: "Tuấn", age: 22, email: "tuan@gmail.com", avatarUrl: "");
  }
}
