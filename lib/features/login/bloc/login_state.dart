part of 'login_bloc.dart';

@Freezed(
  fromJson: false,
)
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String phone,
  }) = _LoginState;
}
