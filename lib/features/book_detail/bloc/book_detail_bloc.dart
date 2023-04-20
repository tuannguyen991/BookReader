// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';
part 'book_detail_bloc.freezed.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  BookDetailBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const BookDetailState()) {
    on<BookDetailLoaded>(_onLoaded);
    on<BookDetailFavoriteChange>(_onFavoriteChange);
    on<BookDetailSaveLocator>(_onSaveLocator);
    on<BookDetailHistory>(_onHistory);
  }

  final BookRepository _bookRepository;

  Future<FutureOr<void>> _onLoaded(
    BookDetailLoaded event,
    Emitter<BookDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isFavorite: false));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    String? locator;

    if (event.bookItem.lastLocator != '') {
      locator =
          '{"bookId":"${event.bookItem.bookId}","href":"${event.bookItem.href}","locations":${event.bookItem.lastLocator},"readPage":0}';
    }

    // get sameCategoryBook
    final list = await _bookRepository.getSameCategoryBook(
      token: token,
      bookItem: event.bookItem,
    );

    final isFavorite = await _bookRepository.getIsFavorite(
      token: token,
      bookId: event.bookItem.bookId,
    );

    emit(state.copyWith(
      sameCategoryBooks: list,
      isFavorite: isFavorite,
      isLoading: false,
      locatorString: locator,
      bookId: event.bookItem.bookId,
    ));
  }

  Future<FutureOr<void>> _onFavoriteChange(
    BookDetailFavoriteChange event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    if (state.isFavorite) {
      await _bookRepository.deleteFavorite(token: token, bookId: event.bookId);
    } else {
      await _bookRepository.createFavorite(token: token, bookId: event.bookId);
    }
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }

  Future<FutureOr<void>> _onHistory(
    BookDetailHistory event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    await _bookRepository.addUserHistory(token: token, time: event.time);
  }

  FutureOr<void> _onSaveLocator(
    BookDetailSaveLocator event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    emit(state.copyWith(locatorString: event.locatorString));

    Map<String, dynamic> jsonMap = json.decode(event.locatorString);

    var href = jsonMap['href'];
    var readPage = jsonMap['readPage'];
    var locations = json.encode(jsonMap['locations']);

    await _bookRepository.createReading(
      token: token,
      bookId: state.bookId,
      href: href,
      readPage: readPage,
      locations: locations,
    );
  }
}
