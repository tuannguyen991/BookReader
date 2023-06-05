import 'package:demo_book_reader/models/reminder/reminder_model.dart';
import 'package:demo_book_reader/models/user/create_user/create_user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:flutter/material.dart';

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

  Future<List<ReminderModel>> createReminder({
    required String token,
    required TimeOfDay time,
  });

  Future<List<ReminderModel>> getReminder({
    required String token,
  });

  Future<List<ReminderModel>> deleteReminder({
    required String token,
    required String reminderId,
  });

  Future<List<ReminderModel>> updateReminder({
    required String token,
    required String reminderId,
    required TimeOfDay time,
  });
}
