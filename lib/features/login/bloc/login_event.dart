part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String username;
  final String password;
  final Function onSuccess;
  final Function onFailed;

  Login({required this.username, required this.password, required this.onSuccess, required this.onFailed});
}

class LoginChangeObscure extends LoginEvent {}