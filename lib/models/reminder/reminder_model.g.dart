// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReminderModel _$$_ReminderModelFromJson(Map<String, dynamic> json) =>
    _$_ReminderModel(
      id: json['id'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      time: json['time'] == null
          ? const TimeOfDay(hour: 0, minute: 0)
          : const TimestampConverter().fromJson(json['time'] as String),
    );

Map<String, dynamic> _$$_ReminderModelToJson(_$_ReminderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'time': const TimestampConverter().toJson(instance.time),
    };
