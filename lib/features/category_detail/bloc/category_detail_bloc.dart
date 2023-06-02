// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'category_detail_bloc.freezed.dart';
part 'category_detail_event.dart';
part 'category_detail_state.dart';

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  CategoryDetailBloc({
    required BookRepository bookRepository,
  })  : _bookRepository = bookRepository,
        super(const CategoryDetailState()) {
    on<CategoryDetailLoaded>(_onLoaded);
  }

  final BookRepository _bookRepository;

  Future<FutureOr<void>> _onLoaded(
    CategoryDetailLoaded event,
    Emitter<CategoryDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final books = await _bookRepository.getBookByCategory(
      token: token ?? 'null',
      categoryId: event.categoryId,
    );

    emit(state.copyWith(books: books));
  }
}
