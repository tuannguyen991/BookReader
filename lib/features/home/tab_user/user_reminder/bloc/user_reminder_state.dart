part of 'user_reminder_bloc.dart';

@Freezed(
  fromJson: false,
)
class UserReminderState with _$UserReminderState {
  const factory UserReminderState({
    @Default(true) bool isLoading,
    @Default([ReminderModel()]) List<ReminderModel> userReminderList,
  }) = _UserReminderState;
}
