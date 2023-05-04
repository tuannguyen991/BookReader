part of 'book_detail_bloc.dart';

@Freezed(
  fromJson: false,
)
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    @Default(UserModel()) UserModel user,
    @Default([]) List<BookModel> sameCategoryBooks,
    @Default(UserBookModel()) UserBookModel bookItem,
    @Default('') String highLights,
    @Default(true) isLoading,
    @Default(false) isFavorite,
    @Default(null) String? locatorString,
    @Default('') String bookId,
  }) = _BookDetailState;
}
