part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    ///
    @Default([]) List<BookModel> recommendedBooks,
    //
    @Default(BookModel()) BookModel bookItem,
    //
    @Default(UserModel()) UserModel user,
    //
    UserBookModel? lastBook,
    //
    @Default(true) bool isLoading,
  }) = _TabHomeState;
}
