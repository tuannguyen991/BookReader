import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tab_home_bloc.freezed.dart';
part 'tab_home_event.dart';
part 'tab_home_state.dart';

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

    // final test = prefs.getString('user');
    // if (test != null) {
    //   var response = prefs.getString('recommendedBooks')!;

    //   final parsed = jsonDecode(response).cast<Map<String, dynamic>>();

    //   final books =
    //       parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();

    //   final user = UserModel.fromJson(json.decode(prefs.getString('user')!));
    //   emit(state.copyWith(
    //     recommendedBooks: books,
    //     bookItem: books[0],
    //     user: user,
    //     lastBook: await _bookRepository.getLastBook(token: token),
    //     isLoading: false,
    //   ));
    //   return;
    // }

    /// get RecommendedBooks
    final list = await _bookRepository.getRecommendedBook(token: token);
    await prefs.setString('recommendedBooks', json.encode(list));
    final item = list[0];

    /// get Information of Last book which User read
    final lastBook = await _bookRepository.getLastBook(token: token);

    /// Infomation User
    final user = await _userRepository.getInfor(token: token); // get
    await prefs.setString('user', json.encode(user.toJson()));

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
