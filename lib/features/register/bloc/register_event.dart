part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Register extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String birthday;
  final String? imagePath;
  final Function onSuccess;
  final Function onFailed;

  Register({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthday,
    required this.imagePath,
    required this.onSuccess,
    required this.onFailed,
  });
}

class RegisterChangeObscure extends RegisterEvent {}
