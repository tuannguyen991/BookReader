import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_home_event.dart';
part 'tab_home_state.dart';
part 'tab_home_bloc.freezed.dart';

class TabHomeBloc extends Bloc<TabHomeEvent, TabHomeState> {
  TabHomeBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const TabHomeState()) {
    on<TabHomeLoaded>(_onLoaded);
    on<TabHomeIndexCarouselChange>(_onIndexCarouselChange);
  }

  final BookRepository _bookRepository;
  FutureOr<void> _onLoaded(
    TabHomeLoaded event,
    Emitter<TabHomeState> emit,
  ) async {
    final list = await _bookRepository.getRecommendedBook(userId: 2);
    final item = list[0];
    emit(state.copyWith(recommendedBooks: list, bookItem: item));
   
  }

  FutureOr<void> _onIndexCarouselChange(
    TabHomeIndexCarouselChange event,
    Emitter<TabHomeState> emit,
  ) async {
    emit(state.copyWith(bookItem: state.recommendedBooks[event.index]));
  }
}
