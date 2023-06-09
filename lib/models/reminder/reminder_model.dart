import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

@freezed
class ReminderModel with _$ReminderModel {
  // In order to appropriately override the toString method, we need to declare an named private constructor with the use of
  const ReminderModel._();

  const factory ReminderModel({
    @Default('') String id,
    @Default(false) bool isDefault,
    @Default(true) bool isActive,
    @Default(TimeOfDay(hour: 0, minute: 0))
    @TimestampConverter()
        TimeOfDay time,
  }) = _ReminderModel;

  factory ReminderModel.fromJson(Map<String, Object?> json) =>
      _$ReminderModelFromJson(json);
}

class TimestampConverter implements JsonConverter<TimeOfDay, String> {
  const TimestampConverter();

  @override
  TimeOfDay fromJson(String time) {
    List<String> parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  String toJson(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }
}
