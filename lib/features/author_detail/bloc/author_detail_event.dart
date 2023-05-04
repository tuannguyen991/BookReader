part of 'author_detail_bloc.dart';

@immutable
abstract class AuthorDetailEvent {}

class AuthorDetailLoaded extends AuthorDetailEvent {
  final String authorId;

  AuthorDetailLoaded({required this.authorId});
}
