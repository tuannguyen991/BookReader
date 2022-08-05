// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tab_library_event.dart';
part 'tab_library_state.dart';
part 'tab_library_bloc.freezed.dart';

class TabLibraryBloc extends Bloc<TabLibraryEvent, TabLibraryState> {
  TabLibraryBloc({
    required BookRepository bookRepository,
  })  : _bookRepository = bookRepository,
        super(const TabLibraryState()) {
    on<TabLibraryLoaded>(_onLoaded);
    on<TabLibraryChangeIndexChoice>(_onChangeIndexChoice);
    on<TabLibraryChangeModelShow>(_onChangeModelShow);
  }

  final BookRepository _bookRepository;

  FutureOr<void> _onLoaded(
    TabLibraryLoaded event,
    Emitter<TabLibraryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final readBooks = await _bookRepository.getReadBook(token: token);
    emit(state.copyWith(readBooks: readBooks));

    final favoriteBooks = await _bookRepository.getFavoriteBook(token: token);
    emit(state.copyWith(favoriteBooks: favoriteBooks));

    final uploadBooks = await _bookRepository.getUploadBooks(token: token);
    emit(state.copyWith(uploadBooks: uploadBooks));

    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onChangeIndexChoice(
      TabLibraryChangeIndexChoice event, Emitter<TabLibraryState> emit) async {
    emit(state.copyWith(indexChoice: event.index));
  }

  FutureOr<void> _onChangeModelShow(
      TabLibraryChangeModelShow event, Emitter<TabLibraryState> emit) {
    emit(state.copyWith(isGridShow: event.isGrid));
  }
}
