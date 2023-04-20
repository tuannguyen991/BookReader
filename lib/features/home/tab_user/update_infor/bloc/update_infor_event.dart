part of 'update_infor_bloc.dart';

@immutable
abstract class UpdateInforEvent {}

class UpdateInforLoaded extends UpdateInforEvent {}

class UpdateInfor extends UpdateInforEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String birthday;
  final String? imagePath;
  final Function onSuccess;
  final Function onFailed;

  UpdateInfor({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthday,
    required this.imagePath,
    required this.onSuccess,
    required this.onFailed,
  });
}

class UpdateInforChangeObscure extends UpdateInforEvent {}
