part of 'user_reading_package_bloc.dart';

@immutable
abstract class UserReadingPackageEvent {}

class UserReadingPackageLoaded extends UserReadingPackageEvent {}
class UserReadingPackageRequested extends UserReadingPackageEvent {
  final String readingPackageId;
  final DateTime startDate;

  UserReadingPackageRequested({required this.readingPackageId, required this.startDate});
}