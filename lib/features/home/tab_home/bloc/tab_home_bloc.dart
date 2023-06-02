import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tab_home_bloc.freezed.dart';
part 'tab_home_event.dart';
part 'tab_home_state.dart';

class TabHomeBloc extends Bloc<TabHomeEvent, TabHomeState> {
  TabHomeBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const TabHomeState()) {
    on<TabHomeLoaded>(_onLoaded);
    on<TabHomeIndexCarouselChange>(_onIndexCarouselChange);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onLoaded(
    TabHomeLoaded event,
    Emitter<TabHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    /// Infomation User
    final user = await _userRepository.getInfor(token: token ?? 'null'); // get

    /// get RecommendedBooks
    final list = user.recommendBooks;
    final item = list[0];

    final lastBook = user.lastBook;

    emit(state.copyWith(
      recommendedBooks: list,
      bookItem: item,
      user: user,
      lastBook: lastBook,
      isLoading: false,
    ));
  }

  FutureOr<void> _onIndexCarouselChange(
    TabHomeIndexCarouselChange event,
    Emitter<TabHomeState> emit,
  ) async {
    emit(state.copyWith(bookItem: state.recommendedBooks[event.index]));
  }
}
