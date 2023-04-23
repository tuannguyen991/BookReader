part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailEvent {}

class BookDetailLoaded extends BookDetailEvent {
  final UserBookModel bookItem;

  BookDetailLoaded({required this.bookItem});
}

class BookDetailFavoriteChange extends BookDetailEvent {
  final String bookId;

  BookDetailFavoriteChange({required this.bookId});
}

class BookDetailHistory extends BookDetailEvent {
  final Duration time;

  BookDetailHistory({required this.time});
}

class BookDetailSaveLocator extends BookDetailEvent {
  final String locatorString;

  BookDetailSaveLocator({required this.locatorString});
}
