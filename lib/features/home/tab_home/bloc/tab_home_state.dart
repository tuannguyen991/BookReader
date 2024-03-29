part of 'tab_home_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabHomeState with _$TabHomeState {
  const factory TabHomeState({
    ///
    @Default([]) List<UserBookModel> recommendedBooks,
    //
    @Default(UserBookModel()) UserBookModel bookItem,
    //
    @Default(UserModel()) UserModel user,
    //
    @Default(UserBookModel()) UserBookModel lastBook,
    //
    @Default(true) bool isLoading,
    //
    @Default(true) bool isLogin,
  }) = _TabHomeState;
}
