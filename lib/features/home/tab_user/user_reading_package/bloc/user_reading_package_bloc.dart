// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/models/user_reading_package/user_reading_package_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_reading_package_bloc.freezed.dart';

part 'user_reading_package_event.dart';

part 'user_reading_package_state.dart';

class UserReadingPackageBloc
    extends Bloc<UserReadingPackageEvent, UserReadingPackageState> {
  UserReadingPackageBloc(
      {required this.userRepository, required this.readingPackageRepository})
      : super(const UserReadingPackageState()) {
    on<UserReadingPackageLoaded>(_onLoaded);
  }

  final UserRepository userRepository;
  final ReadingPackageRepository readingPackageRepository;

  FutureOr<void> _onLoaded(UserReadingPackageEvent event,
      Emitter<UserReadingPackageState> emit) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final readingPackageList = await readingPackageRepository.getAll(token: token);
    emit(state.copyWith(readingPackageList: readingPackageList));

    final userReadingPackage = await userRepository.getUserReadingPackage(token: token);

    emit(state.copyWith(
      userReadingPackage: userReadingPackage,
      isLoading: false,
    ));
  }
}
