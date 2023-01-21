import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImplement implements UserRepository {
  @override
  Future<UserModel> getInfor({required String token}) {
    // TODO: implement getInfor
    throw UnimplementedError();
  }

  @override
  Future<String> login({
    required String username,
    required String password,
  }) async {
    const servicePath = '/verify';
    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final id = json.decode(response.body);
      return id;
    }
    throw Exception('');
  }
}