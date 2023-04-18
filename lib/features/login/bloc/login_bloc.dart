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
    on<LoginLoaded>(_onLoaded);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onLoaded(
    LoginLoaded event,
    Emitter<LoginState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('phone');

    emit(state.copyWith(phone: phone ?? ''));
  }
}
