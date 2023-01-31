// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserHistoryModel _$$_UserHistoryModelFromJson(Map<String, dynamic> json) =>
    _$_UserHistoryModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      readingTime: (json['readingTime'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_UserHistoryModelToJson(_$_UserHistoryModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'readingTime': instance.readingTime,
    };
