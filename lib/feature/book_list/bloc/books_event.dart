part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class BooksLoaded extends BooksEvent {}

class BookAdded extends BooksEvent {
  final BookModel item;

  BookAdded(this.item);
}

class BooksDeleteRequested extends BooksEvent {
  final String name;

  BooksDeleteRequested(this.name);
}