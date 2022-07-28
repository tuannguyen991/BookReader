// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tab_user_event.dart';
part 'tab_user_state.dart';
part 'tab_user_bloc.freezed.dart';

class TabUserBloc extends Bloc<TabUserEvent, TabUserState> {
  TabUserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const TabUserState()) {
    on<TabUserLoaded>(_onLoaded);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onLoaded(
    TabUserLoaded event,
    Emitter<TabUserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    // get Information of User
    final user = await _userRepository.getInfor(token: token);

    emit(state.copyWith(
      user: user,
      isLoading: false,
    ));
  }
}