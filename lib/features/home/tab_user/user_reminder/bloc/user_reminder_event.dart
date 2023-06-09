part of 'user_reminder_bloc.dart';

@immutable
abstract class UserReminderEvent {}

class UserReminderLoaded extends UserReminderEvent {}

class UserReminderNewRequested extends UserReminderEvent {
  final DateTime time;

  UserReminderNewRequested({required this.time});
}

class UserReminderDeleteRequested extends UserReminderEvent {
  final String reminderId;

  UserReminderDeleteRequested({required this.reminderId});
}

class UserReminderUpdateRequested extends UserReminderEvent {
  final String reminderId;
  final TimeOfDay time;
  final bool isActive;

  UserReminderUpdateRequested(
      {required this.reminderId, required this.time, required this.isActive});
}
