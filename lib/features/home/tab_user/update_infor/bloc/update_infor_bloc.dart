// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/update_user/update_user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'update_infor_bloc.freezed.dart';
part 'update_infor_event.dart';
part 'update_infor_state.dart';

class UpdateInforBloc extends Bloc<UpdateInforEvent, UpdateInforState> {
  UpdateInforBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UpdateInforState()) {
    on<UpdateInfor>(_onUpdateInfor);
    on<UpdateInforLoaded>(_onLoaded);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onUpdateInfor(
      UpdateInfor event, Emitter<UpdateInforState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('token')!;

      final user = UpdateUserModel(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        birthDate: event.birthday == ''
            ? DateFormat('yyyy-MM-dd').format(DateTime.now())
            : event.birthday,
      );

      await _userRepository.updateUser(token: id, user: user);

      if (event.imagePath != null) {
        await _userRepository.uploadImage(userId: id, path: event.imagePath!);
      }

      prefs.setString('token', id);

      event.onSuccess();
    } catch (e) {
      event.onFailed();
    }
  }

  FutureOr<void> _onLoaded(
    UpdateInforLoaded event,
    Emitter<UpdateInforState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    // get Information of User
    final user = await _userRepository.getInforWithCurrentPackage(token: token);

    emit(state.copyWith(
      user: user,
    ));
  }
}
