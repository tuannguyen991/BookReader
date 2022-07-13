import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/models/author_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'authors_event.dart';
part 'authors_state.dart';

part 'authors_bloc.freezed.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  AuthorsBloc({required AuthorRepository authorRepository})
      : _authorRepository = authorRepository,
        super(const AuthorsState()) {
    on<AuthorsLoaded>(_onLoaded);
    on<AuthorAdded>(_onAdded);
    on<AuthorsDeleteRequested>(_onDeleteRequested);
  }

  final AuthorRepository _authorRepository;

  FutureOr<void> _onLoaded(
      AuthorsLoaded event, Emitter<AuthorsState> emit) async {
    final list = await _authorRepository.getAuthors();
    emit(state.copyWith(authors: list));
  }

  FutureOr<void> _onAdded(AuthorAdded event, Emitter<AuthorsState> emit) {
    _authorRepository.addAuthor(event.item);
  }

  FutureOr<void> _onDeleteRequested(
      AuthorsDeleteRequested event, Emitter<AuthorsState> emit) {
    _authorRepository.deleteAuthor(event.authorId);
    add(AuthorsLoaded());
  }
}
