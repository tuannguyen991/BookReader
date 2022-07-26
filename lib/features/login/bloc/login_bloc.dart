// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const LoginState()) {
    on<Login>(_onLogin);
    on<LoginChangeObscure>(_onObscure);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onLogin(Login event, Emitter<LoginState> emit) async {
    String result = await _userRepository.login(
      username: event.username,
      password: event.password,
    );
    if (result != '') {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', result);
      // print(result);
      event.onSuccess();
      return;
    }

    event.onFailed();
  }

  FutureOr<void> _onObscure(LoginChangeObscure event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObscure: !state.isObscure));
  }
}
