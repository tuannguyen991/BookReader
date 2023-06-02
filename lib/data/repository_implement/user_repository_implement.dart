import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/create_user/create_user_model.dart';
import 'package:demo_book_reader/models/user/update_user/update_user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImplement implements UserRepository {
  final http.Client _client;
  UserRepositoryImplement(this._client);

  @override
  Future<UserModel> getInfor({required String token}) async {
    var servicePath = '/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await _client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 404) {
      const user = UserModel();
      return user;
    }

    throw Exception('');
  }

  @override
  Future<UserModel> getInforWithCurrentPackage({required String token}) async {
    var servicePath = '/current-package/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await _client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 404) {
      const user = UserModel();
      return user;
    }

    throw Exception('');
  }

  @override
  Future<void> createUser({required CreateUserModel user}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final id = json.decode(response.body);
      return id;
    }

    throw Exception('');
  }

  @override
  Future<void> updateUser({
    required String token,
    required UpdateUserModel user,
  }) async {
    var servicePath = '/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> uploadImage(
      {required String userId, required String path}) async {
    const servicePath = 'image';

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        'https://${Remote.authority}/${Remote.pathUsers}/$userId/$servicePath',
      ),
    );
    request.files.add(await http.MultipartFile.fromPath('file', path));
    var response = await request.send();
    if (response.statusCode == 200) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<UserModel> registerReadingPackage(
      {required String token,
      required String readingPackageId,
      required DateTime startDate}) async {
    const servicePath = '/reading-package';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': token,
        'readingPackageId': readingPackageId,
        'startDate': startDate.toIso8601String()
      }),
    );

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(json.decode(response.body));
      return user;
    }

    throw Exception('');
  }
}
