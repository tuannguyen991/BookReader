import 'package:demo_book_reader/models/high_light/high_light_notification/high_light_notification_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';

abstract class BookRepository {
  Future<List<UserBookModel>> getBookByCategory({
    required String token,
    required String categoryId,
  });

  Future<List<UserBookModel>> getTopBook({required String token});

  Future<List<UserBookModel>> getBookByAuthor({
    required String token,
    required String authorId,
  });

  Future<UserBookModel> getUserBook(
      {required String token, required UserBookModel bookItem});

  Future<void> createReading({
    required String token,
    required String bookId,
    required String href,
    required String locations,
    required int readPage,
  });

  Future<void> createFavorite({required String token, required String bookId});

  Future<void> deleteFavorite({required String token, required String bookId});

  Future<List<UserBookModel>> getReadBook({required String token});

  Future<List<UserBookModel>> getFavoriteBook({required String token});

  Future<List<String>> getHistorySearch({required String token});

  Future<void> addUserHistory({required String token, required Duration time});

  Future<List<UserBookModel>> getBooksByName(
      {required String token, required String name});

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
  });

  Future<void> updateHighLight({
    required String token,
    required int date,
    required String type,
    required String rangy,
    required String? note,
    required String uuid,
  });

  Future<void> deleteHighLight({
    required String token,
    required String uuid,
  });

  Future<String> getHighLights({required String token, required String bookId});

  Future<HighLightNotificationModel> getHighLightNotification(
      {required String token});
}
