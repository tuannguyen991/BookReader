// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/data/repository_fake/book_repository_fake.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'library_upload_event.dart';
part 'library_upload_state.dart';
part 'library_upload_bloc.freezed.dart';

class LibraryUploadBloc extends Bloc<LibraryUploadEvent, LibraryUploadState> {
  LibraryUploadBloc({
    required CategoryRepository categoryRepository,
    required BookRepository bookRepository,
  })  : _categoryRepository = categoryRepository,
        _bookRepository = bookRepository,
        super(const LibraryUploadState()) {
    on<LibraryUploadLoaded>(_onLoaded);
    on<LibraryUploadSave>(_onSave);
    on<LibraryUploadEpub>(_onEpub);
  }
  final CategoryRepository _categoryRepository;
  final BookRepository _bookRepository;

  FutureOr<void> _onLoaded(
    LibraryUploadLoaded event,
    Emitter<LibraryUploadState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final categories = await _categoryRepository.getCategories(token: token);
    emit(state.copyWith(categories: categories, isLoading: false));
  }

  FutureOr<void> _onSave(
    LibraryUploadSave event,
    Emitter<LibraryUploadState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    if (event.title.isNotEmpty) {
      emit(state.copyWith(
          bookItem: state.bookItem.copyWith(title: event.title)));
    }

    if (event.author.isNotEmpty) {
      emit(state.copyWith(
          bookItem: state.bookItem.copyWith(
              authors: state.bookItem.authors +
                  [AuthorModel(name: event.author)])));
    }

    if (event.description.isNotEmpty) {
      emit(state.copyWith(
          bookItem: state.bookItem.copyWith(description: event.description)));
    }

    await _bookRepository.addUploadBook(token: token, bookItem: state.bookItem);
  }

  FutureOr<void> _onEpub(
    LibraryUploadEpub event,
    Emitter<LibraryUploadState> emit,
  ) async {
    emit(
      state.copyWith(
        bookItem: state.bookItem.copyWith(
          id: event.linkEpub,
          // isFile: true,
        ),
      ),
    );
  }
}
