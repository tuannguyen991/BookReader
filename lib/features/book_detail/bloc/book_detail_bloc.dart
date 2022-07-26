import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
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
  }

  final BookRepository _bookRepository;

  Future<FutureOr<void>> _onLoaded(
      BookDetailLoaded event, Emitter<BookDetailState> emit) async {
    emit(state.copyWith(isLoading: true, isFavorite: false));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    // get sameCategoryBook
    final list = await _bookRepository.getSameCategoryBook(
      token: token,
      bookItem: event.bookItem,
    );

    final isFavorite = await _bookRepository.getIsFavorite(
      token: token,
      bookItem: event.bookItem,
    );

    emit(state.copyWith(
        sameCategoryBooks: list, isFavorite: isFavorite, isLoading: false));
  }

  FutureOr<void> _onFavoriteChange(
      BookDetailFavoriteChange event, Emitter<BookDetailState> emit) {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }
}
