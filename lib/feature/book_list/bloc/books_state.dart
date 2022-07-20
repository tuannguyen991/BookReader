part of 'books_bloc.dart';

@Freezed(
  fromJson: false,
  equal: false,
)
class BooksState with _$BooksState {
  const factory BooksState({
    @Default([]) List<BookModel> books,
    @Default(false) bool isLoading,
  }) = _BooksState;
}