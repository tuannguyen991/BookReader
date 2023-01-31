// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_search_event.dart';
part 'home_search_state.dart';
part 'home_search_bloc.freezed.dart';

class HomeSearchBloc extends Bloc<HomeSearchEvent, HomeSearchState> {
  HomeSearchBloc({
    required BookRepository bookRepository,
    required AuthorRepository authorRepository,
    required CategoryRepository categoryRepository,
  })  : _bookRepository = bookRepository,
        _authorRepository = authorRepository,
        _categoryRepository = categoryRepository,
        super(const HomeSearchState()) {
    on<HomeSearchLoaded>(_onLoaded);
    on<HomeSearchDeleteHistoryItem>(_onDeleteHistory);
    on<HomeSearchGetRecommendedByName>(_onGetRecommendedByName);
  }

  final BookRepository _bookRepository;
  final AuthorRepository _authorRepository;
  final CategoryRepository _categoryRepository;

  FutureOr<void> _onLoaded(
    HomeSearchLoaded event,
    Emitter<HomeSearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final listHistory = await _bookRepository.getHistorySearch(token: token);
    emit(state.copyWith(history: listHistory));

    final listCategory = await _categoryRepository.getCategories(token: token);
    emit(state.copyWith(listCategory: listCategory));

    final listBook = await _bookRepository.getTopBook(token: token);
    emit(state.copyWith(listBook: listBook));

    final listAuthor = await _authorRepository.getAuthors(token: token);
    emit(state.copyWith(listAuthor: listAuthor));

    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onDeleteHistory(
    HomeSearchDeleteHistoryItem event,
    Emitter<HomeSearchState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    _bookRepository.deleteHistory(token: token, name: event.name);

    add(HomeSearchLoaded());
  }

  FutureOr<void> _onGetRecommendedByName(
    HomeSearchGetRecommendedByName event,
    Emitter<HomeSearchState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    emit(state.copyWith(isLoading: true));

    if (event.name == '') {
      emit(state.copyWith(
          listRecommendedByName: [], isLoading: false));
      return;
    }

    final listRecommendedByName = [
      ...await _bookRepository.getBooksByName(token: token, name: event.name),
      ...await _authorRepository.getAuthorsByName(
          token: token, name: event.name),
      ...await _categoryRepository.getCategoriesByName(
          token: token, name: event.name),
    ];

    emit(state.copyWith(
        listRecommendedByName: listRecommendedByName, isLoading: false));
  }
}
