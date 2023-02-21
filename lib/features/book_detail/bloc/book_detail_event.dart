part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailEvent {}

class BookDetailLoaded extends BookDetailEvent {
  final UserBookModel bookItem;

  BookDetailLoaded({required this.bookItem});
}

class BookDetailFavoriteChange extends BookDetailEvent {
  final BookModel bookItem;

  BookDetailFavoriteChange({required this.bookItem});
}

class BookDetailSaveLocator extends BookDetailEvent {
  final String locatorString;

  BookDetailSaveLocator({required this.locatorString});
}
