// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/models/user_reading_package/detail_current_package_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_reading_package_bloc.freezed.dart';
part 'user_reading_package_event.dart';
part 'user_reading_package_state.dart';

class UserReadingPackageBloc
    extends Bloc<UserReadingPackageEvent, UserReadingPackageState> {
  UserReadingPackageBloc({
    required this.user,
    required this.readingPackageRepository,
    required this.userRepository,
  }) : super(const UserReadingPackageState()) {
    on<UserReadingPackageLoaded>(_onLoaded);
    on<UserReadingPackageRequested>(_onRequested);
  }

  final UserModel user;
  final ReadingPackageRepository readingPackageRepository;
  final UserRepository userRepository;

  FutureOr<void> _onLoaded(UserReadingPackageLoaded event,
      Emitter<UserReadingPackageState> emit) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final readingPackageList =
        await readingPackageRepository.getAll(token: token);
    readingPackageList.sort((a, b) => a.price.compareTo(b.price));

    UserModel updatedUser = await userRepository.getInforWithCurrentPackage(
      token: user.id,
    );

    if (updatedUser.currentPackage != null) {
      final matchedPackage = readingPackageList.firstWhere((element) =>
          element.id == updatedUser.currentPackage!.readingPackageId);
      final currentPackage = DetailCurrentPackage(
          matchedPackage,
          updatedUser.currentPackage!.startDate,
          updatedUser.currentPackage!.endDate);
      emit(state.copyWith(
          readingPackageList: readingPackageList,
          currentPackage: currentPackage,
          isLoading: false));
    } else {
      emit(state.copyWith(
          readingPackageList: readingPackageList, isLoading: false));
    }
  }

  FutureOr<void> _onRequested(UserReadingPackageRequested event,
      Emitter<UserReadingPackageState> emit) async {
    try {
      UserModel updatedDate = await userRepository.registerReadingPackage(
          token: user.id,
          readingPackageId: event.readingPackageId,
          startDate: event.startDate);
    } catch (e) {
      print(e);
    }
  }
}
