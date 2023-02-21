part of 'book_detail_bloc.dart';

@Freezed(
  fromJson: false,
)
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    @Default([]) List<BookModel> sameCategoryBooks,
    @Default(true) isLoading,
    @Default(false) isFavorite,
    @Default(null) String? locatorString
  }) = _BookDetailState;
}
