part of 'tab_user_bloc.dart';

@Freezed(
  fromJson: false,
)
class TabUserState with _$TabUserState {
  const factory TabUserState({
    @Default(true)
        bool isLoading,
    //
    @Default(
      UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        password: '',
        email: '',
        phone: '',
        age: -1,
        gender: false,
        imageLink: '',
        imagaLinkRanking: '',
        readingTime: 0,
        readBooks: 0,
      ),
    )
        UserModel user,
  }) = _TabUserState;
}
