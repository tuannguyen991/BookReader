// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/create_user/create_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const RegisterState()) {
    on<Register>(_onRegister);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onRegister(
      Register event, Emitter<RegisterState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('token')!;
      // String id = '6h38NGTh5lPZMTB0U83Rv0WUE1A2';

      final user = CreateUserModel(
        id: id,
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        birthDate: event.birthday == ''
            ? DateFormat('yyyy-MM-dd').format(DateTime.now())
            : event.birthday,
      );

      await _userRepository.createUser(user: user);

      if (event.imagePath != null) {
        await _userRepository.uploadImage(
            userId: user.id, path: event.imagePath!);
      }

      prefs.setString('token', id);

      event.onSuccess();
    } catch (e) {
      event.onFailed();
    }
  }
}
