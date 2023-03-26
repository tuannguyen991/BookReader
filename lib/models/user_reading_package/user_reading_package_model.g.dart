// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reading_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReadingPackageModel _$$_UserReadingPackageModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserReadingPackageModel(
      readingPackageId: json['readingPackageId'] as String? ?? '',
      startDate: json['startDate'] == null
          ? const ConstDateTime(2023)
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? const ConstDateTime(2023)
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_UserReadingPackageModelToJson(
        _$_UserReadingPackageModel instance) =>
    <String, dynamic>{
      'readingPackageId': instance.readingPackageId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
