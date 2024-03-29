import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/reminder/reminder_model.dart';
import 'package:demo_book_reader/models/user/create_user/create_user_model.dart';
import 'package:demo_book_reader/models/user/update_user/update_user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:flutter/material.dart';
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

  @override
  Future<List<ReminderModel>> createReminder({
    required String token,
    required TimeOfDay time,
  }) async {
    const servicePath = '/reminder';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    var timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '{"userId":"$token", "time":"$timeString"}',
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final reminders = parsed
          .map<ReminderModel>((json) => ReminderModel.fromJson(json))
          .toList();
      return reminders;
    }

    throw Exception('');
  }

  @override
  Future<List<ReminderModel>> deleteReminder({
    required String token,
    required String reminderId,
  }) async {
    var servicePath = '/reminder/$token/$reminderId';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.delete(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final reminders = parsed
          .map<ReminderModel>((json) => ReminderModel.fromJson(json))
          .toList();
      return reminders;
    }

    throw Exception('');
  }

  @override
  Future<List<ReminderModel>> getReminder({required String token}) async {
    var servicePath = '/reminder/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final reminders = parsed
          .map<ReminderModel>((json) => ReminderModel.fromJson(json))
          .toList();
      return reminders;
    }

    throw Exception('');
  }

  @override
  Future<List<ReminderModel>> updateReminder({
    required String token,
    required String reminderId,
    required TimeOfDay time,
    required bool isActive,
  }) async {
    var servicePath = '/reminder/$token/$reminderId';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    var timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '{"time":"$timeString", "isActive":"$isActive"}',
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final reminders = parsed
          .map<ReminderModel>((json) => ReminderModel.fromJson(json))
          .toList();
      return reminders;
    }

    throw Exception('');
  }
}
