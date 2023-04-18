part of 'register_bloc.dart';

@Freezed(
  fromJson: false,
)
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(true) bool isObscure,
  }) = _RegisterState;
}
