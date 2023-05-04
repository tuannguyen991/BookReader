// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'book_detail_bloc.freezed.dart';
part 'book_detail_event.dart';
part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  BookDetailBloc(
      {required BookRepository bookRepository,
      required UserRepository userRepository})
      : _bookRepository = bookRepository,
        _userRepository = userRepository,
        super(const BookDetailState()) {
    on<BookDetailLoaded>(_onLoaded);
    on<BookDetailFavoriteChange>(_onFavoriteChange);
    on<BookDetailSaveLocator>(_onSaveLocator);
    on<BookDetailHistory>(_onHistory);
    on<BookDetailHighLight>(_onHighLight);
    on<BookDetailGetHighLights>(_onGetHighLights);
    on<BookDetailReading>(_onReading);
  }

  final BookRepository _bookRepository;
  final UserRepository _userRepository;

  Future<FutureOr<void>> _onLoaded(
    BookDetailLoaded event,
    Emitter<BookDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isFavorite: false));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    UserBookModel bookItem = await _bookRepository.getUserBook(
      token: token,
      bookItem: event.bookItem,
    );

    final user = await _userRepository.getInfor(token: token);

    String? locator;

    if (bookItem.lastLocator != '') {
      locator =
          '{"bookId":"${bookItem.bookId}","href":"${bookItem.href}","locations":${bookItem.lastLocator},"readPage":0}';
    }

    // get sameCategoryBook
    final list = await _bookRepository.getSameCategoryBook(
      token: token,
      bookItem: bookItem,
    );

    final isFavorite = await _bookRepository.getIsFavorite(
      token: token,
      bookId: bookItem.bookId,
    );

    final highLights = await _bookRepository.getHighLights(
      token: token,
      bookId: bookItem.bookId,
    );

    emit(state.copyWith(
      user: user,
      sameCategoryBooks: list,
      isFavorite: isFavorite,
      highLights: highLights,
      bookItem: bookItem,
      isLoading: false,
      locatorString: locator,
      bookId: bookItem.bookId,
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

  FutureOr<void> _onHighLight(
    BookDetailHighLight event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final enumString = event.highLight[0];

    final highLight = event.highLight.substring(14).replaceAll('\n', '');

    Map<String, dynamic> jsonMap = json.decode(highLight);

    var bookId = jsonMap['bookId'];
    var content = jsonMap['content'];
    var date = jsonMap['date'];
    var type = jsonMap['type'];
    var pageNumber = jsonMap['pageNumber'];
    var pageId = jsonMap['pageId'];
    var rangy = jsonMap['rangy'];
    var note = jsonMap['note'];
    var uuid = jsonMap['uuid'];

    switch (enumString) {
      case '0':
        await _bookRepository.createHighLight(
          token: token,
          bookId: bookId,
          content: content,
          date: date,
          type: type,
          note: note,
          pageId: pageId,
          pageNumber: pageNumber,
          rangy: rangy,
          uuid: uuid,
        );
        break;
      case '1':
        await _bookRepository.updateHighLight(
          token: token,
          date: date,
          type: type,
          note: note,
          rangy: rangy,
          uuid: uuid,
        );
        break;
      case '2':
      default:
        await _bookRepository.deleteHighLight(
          token: token,
          uuid: uuid,
        );
        break;
    }
  }

  Future<void> _onGetHighLights(
    BookDetailGetHighLights event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final highLights = await _bookRepository.getHighLights(
      token: token,
      bookId: state.bookId,
    );

    emit(state.copyWith(highLights: highLights));
  }

  Future<void> _onReading(
    BookDetailReading event,
    Emitter<BookDetailState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final user = await _userRepository.getInfor(token: token);
    emit(state.copyWith(user: user));

    if (user.currentPackage != null) {
      event.onSuccess();
    } else {
      event.onFailed();
    }
  }
}
