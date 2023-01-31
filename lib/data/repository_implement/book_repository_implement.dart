import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';

import 'package:http/http.dart' as http;

class BookRepositoryImplement implements BookRepository {
  @override
  Future<void> addUploadBook(
      {required String token, required BookModel bookItem}) {
    // TODO: implement addUploadBook
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHistory({required String token, required String name}) {
    // TODO: implement deleteHistory
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> getBooksByName(
      {required String token, required String name}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathBooks}$servicePath',
      {'Filter': name},
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final books =
          parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<UserBookModel>> getFavoriteBook({required String token}) async {
    var servicePath = '/favorite-books/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final userBooks = parsed
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
      return userBooks;
    }

    throw Exception('');
  }

  @override
  Future<List<String>> getHistorySearch({required String token}) async {
    return [
      'Harry Potter',
      'J. K. Rowling',
      'Stronger',
    ];
  }

  @override
  Future<bool> getIsFavorite(
      {required String token, required UserBookModel bookItem}) async {
    return false;
  }

  @override
  Future<UserBookModel> getLastBook({required String token}) async {
    final userBooks = await getReadBook(token: token);
    return userBooks.last;
  }

  @override
  Future<List<UserBookModel>> getReadBook({required String token}) async {
    var servicePath = '/reading-books/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final userBooks = parsed
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
      return userBooks;
    }

    throw Exception('');
  }

  @override
  Future<List<BookModel>> getRecommendedBook({required String token}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathBooks}$servicePath',
      {'MaxResultCount': '3'},
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final books =
          parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<BookModel>> getSameCategoryBook(
      {required String token, required UserBookModel bookItem}) async {
    var servicePath = '/by-category/${bookItem.categories.first.id}';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathBooks}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final books = parsed
          .map<BookModel>((json) => BookModel.fromJson(json))
          .toList() as List<BookModel>;

      books.removeWhere((element) => element.id == bookItem.bookId);
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<BookModel>> getTopBook({required String token}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathBooks}$servicePath',
      {'MaxResultCount': '6'},
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final books =
          parsed.map<BookModel>((json) => BookModel.fromJson(json)).toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<BookModel>> getUploadBooks({required String token}) {
    // TODO: implement getUploadBooks
    throw UnimplementedError();
  }
}
