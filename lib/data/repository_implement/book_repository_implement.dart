import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/high_light/high_light_notification/high_light_notification_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BookRepositoryImplement implements BookRepository {
  @override
  Future<List<UserBookModel>> getBooksByName(
      {required String token, required String name}) async {
    var servicePath = '/by-name/$token';

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

      final books = parsed
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
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
  Future<void> createFavorite(
      {required String token, required String bookId}) async {
    var servicePath = '/favorite-books';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '{"userId":"$token", "bookId":"$bookId"}',
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> deleteFavorite(
      {required String token, required String bookId}) async {
    var servicePath = '/favorite-books/$token/$bookId';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.delete(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> addUserHistory({
    required String token,
    required Duration time,
  }) async {
    var servicePath = '/history';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var timeFormat = time.toString().split('.').first.padLeft(8, '0');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '{"userId":"$token", "date":"$date", "readingTime": "$timeFormat"}',
    );

    if (response.statusCode == 200) {
      return;
    }

    throw Exception('');
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
  Future<UserBookModel> getUserBook(
      {required String token, required UserBookModel bookItem}) async {
    var servicePath = '/library-book/$token/${bookItem.id}';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserBookModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return bookItem;
    }

    throw Exception('');
  }

  @override
  Future<List<UserBookModel>> getTopBook({required String token}) async {
    var servicePath = '/top-books/$token';

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
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<UserBookModel>> getBookByCategory({
    required String token,
    required String categoryId,
  }) async {
    var servicePath = '/by-category/$token/$categoryId';

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
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<List<UserBookModel>> getBookByAuthor({
    required String token,
    required String authorId,
  }) async {
    var servicePath = '/by-author/$token/$authorId';

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
          .map<UserBookModel>((json) => UserBookModel.fromJson(json))
          .toList();
      return books;
    }

    throw Exception('');
  }

  @override
  Future<void> createReading({
    required String token,
    required String bookId,
    required String href,
    required String locations,
    required int readPage,
  }) async {
    var servicePath = '/reading-books';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}$servicePath',
    );

    locations = locations.replaceAll('"', '\\"');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body:
          '{"userId":"$token", "bookId":"$bookId", "numberOfReadPages":$readPage, "lastLocator":"$locations", "href":"$href"}',
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> createHighLight({
    required String token,
    required String bookId,
    required String content,
    required int date,
    required String type,
    required int pageNumber,
    required String pageId,
    required String rangy,
    required String? note,
    required String uuid,
  }) async {
    var servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathHighLight}$servicePath',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body:
          '{"userId":"$token", "bookId":"$bookId", "date":$date, "pageNumber":$pageNumber, "content":"$content", "type":"$type", "pageId":"$pageId", "rangy":"$rangy", "note":"$note", "uuid":"$uuid"}',
    );

    if (response.statusCode == 200) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> updateHighLight({
    required String token,
    required int date,
    required String type,
    required String rangy,
    required String? note,
    required String uuid,
  }) async {
    var servicePath = '/$uuid';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathHighLight}$servicePath',
    );

    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body:
          '{"userId":"$token", "date":$date, "type":"$type", "rangy":"$rangy", "note":"$note"}',
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<void> deleteHighLight({
    required String token,
    required String uuid,
  }) async {
    var servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathHighLight}$servicePath',
    );

    final response = await http.delete(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '{"userId":"$token", "id":"$uuid"}',
    );

    if (response.statusCode == 204) {
      return;
    }

    throw Exception('');
  }

  @override
  Future<String> getHighLights({
    required String token,
    required String bookId,
  }) async {
    var servicePath = '/$token/$bookId';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathHighLight}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return response.body;
    }

    throw Exception('');
  }

  @override
  Future<HighLightNotificationModel> getHighLightNotification({
    required String token,
  }) async {
    var servicePath = '/$token';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathHighLight}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return HighLightNotificationModel.fromJson(json.decode(response.body));
    }

    return const HighLightNotificationModel();
  }
}
