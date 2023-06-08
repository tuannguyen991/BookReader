part of 'user_reminder_bloc.dart';

@immutable
abstract class UserReminderEvent {}

class UserReminderLoaded extends UserReminderEvent {}

class UserReminderNewRequested extends UserReminderEvent {
  final String time;

  UserReminderNewRequested({required this.time});
}
