part of 'tab_user_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabUserState with _$TabUserState {
  const factory TabUserState({
    @Default(true) bool isLoading,
    @Default(UserModel()) UserModel user,
    @Default([]) List<UserBookModel> readBooks,
  }) = _TabUserState;
}
