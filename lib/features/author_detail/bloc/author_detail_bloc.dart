// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_detail_bloc.freezed.dart';
part 'author_detail_event.dart';
part 'author_detail_state.dart';

class AuthorDetailBloc extends Bloc<AuthorDetailEvent, AuthorDetailState> {
  AuthorDetailBloc({
    required BookRepository bookRepository,
  })  : _bookRepository = bookRepository,
        super(const AuthorDetailState()) {
    on<AuthorDetailLoaded>(_onLoaded);
  }

  final BookRepository _bookRepository;

  Future<FutureOr<void>> _onLoaded(
    AuthorDetailLoaded event,
    Emitter<AuthorDetailState> emit,
  ) async {
    final books = await _bookRepository.getBookByAuthor(
      authorId: event.authorId,
    );

    emit(state.copyWith(books: books));
  }
}
