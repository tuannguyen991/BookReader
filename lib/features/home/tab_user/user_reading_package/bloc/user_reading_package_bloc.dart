// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/util/detail_current_package_type.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_reading_package_bloc.freezed.dart';

part 'user_reading_package_event.dart';

part 'user_reading_package_state.dart';

class UserReadingPackageBloc
    extends Bloc<UserReadingPackageEvent, UserReadingPackageState> {
  UserReadingPackageBloc(
      {required this.user, required this.readingPackageRepository})
      : super(const UserReadingPackageState()) {
    on<UserReadingPackageLoaded>(_onLoaded);
  }

  final UserModel user;
  final ReadingPackageRepository readingPackageRepository;

  FutureOr<void> _onLoaded(UserReadingPackageEvent event,
      Emitter<UserReadingPackageState> emit) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final readingPackageList =
        await readingPackageRepository.getAll(token: token);
    readingPackageList.sort((a, b) => a.price.compareTo(b.price));

    if (user.currentPackage != null) {
      final matchedPackage = readingPackageList.firstWhere(
          (element) => element.id == user.currentPackage?.readingPackageId);
      final currentPackage = DetailCurrentPackage(matchedPackage,
          user.currentPackage!.startDate, user.currentPackage!.endDate);
      emit(state.copyWith(
          readingPackageList: readingPackageList,
          currentPackage: currentPackage,
          isLoading: false));
    } else {
      emit(state.copyWith(
          readingPackageList: readingPackageList, isLoading: false));
    }
  }
}
