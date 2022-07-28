part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    //
    @Default([]) List<BookModel> recommendedBooks,
    //
    @Default(BookModel()) BookModel bookItem,
    //
    @Default(UserModel()) UserModel user,
    //
    @Default(BookModel()) BookModel lastBook,
    //
    @Default(true) bool isLoading,
  }) = _TabHomeState;
}
