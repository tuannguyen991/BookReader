import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

part 'books_bloc.freezed.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const BooksState()) {
    on<BooksLoaded>(_onLoaded);
    on<BookAdded>(_onAdded);
    on<BooksDeleteRequested>(_onDeleteRequested);
  }

  final BookRepository _bookRepository;

  FutureOr<void> _onLoaded(
      BooksLoaded event, Emitter<BooksState> emit) async {
    emit(state.copyWith(isLoading: true, books: []));
    final list = await _bookRepository.getBooks();
    emit(state.copyWith(books: list, isLoading: false));
  }

  FutureOr<void> _onAdded(BookAdded event, Emitter<BooksState> emit) {
    _bookRepository.addBook(event.item);
  }

  FutureOr<void> _onDeleteRequested(
      BooksDeleteRequested event, Emitter<BooksState> emit) {
    _bookRepository.deleteBook(event.name);
    add(BooksLoaded());
  }
}
