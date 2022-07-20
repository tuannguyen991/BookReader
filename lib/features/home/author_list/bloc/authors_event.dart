part of 'authors_bloc.dart';

@immutable
abstract class AuthorsEvent {}

class AuthorsLoaded extends AuthorsEvent {}

class AuthorAdded extends AuthorsEvent {
  final AuthorModel item;

  AuthorAdded(this.item);
}

class AuthorsDeleteRequested extends AuthorsEvent {
  final String authorId;

  AuthorsDeleteRequested(this.authorId);
}
