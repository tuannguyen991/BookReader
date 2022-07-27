import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tab_home_event.dart';
part 'tab_home_state.dart';
part 'tab_home_bloc.freezed.dart';

class TabHomeBloc extends Bloc<TabHomeEvent, TabHomeState> {
  TabHomeBloc({
    required BookRepository bookRepository,
    required UserRepository userRepository,
  })  : _bookRepository = bookRepository,
        _userRepository = userRepository,
        super(const TabHomeState()) {
    on<TabHomeLoaded>(_onLoaded);
    on<TabHomeIndexCarouselChange>(_onIndexCarouselChange);
  }

  final BookRepository _bookRepository;
  final UserRepository _userRepository;

  FutureOr<void> _onLoaded(
    TabHomeLoaded event,
    Emitter<TabHomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    // get RecommendedBook
    final list = await _bookRepository.getRecommendedBook(token: token);
    final item = list[0];

    // emit(state.copyWith(recommendedBooks: list, bookItem: item));

    // get Information of Last book which User read
    final lastBook = await _bookRepository.getLastBook(token: token);

    // emit(state.copyWith(lastBook: lastBook));

    // get Information of User
    final user = await _userRepository.getInfor(token: token);

    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      recommendedBooks: list,
      bookItem: item,
      user: user,
      lastBook: lastBook,
      isLoading: false,
    ));

    // emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onIndexCarouselChange(
    TabHomeIndexCarouselChange event,
    Emitter<TabHomeState> emit,
  ) async {
    emit(state.copyWith(bookItem: state.recommendedBooks[event.index]));
  }
}
