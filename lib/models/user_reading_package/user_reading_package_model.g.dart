// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reading_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReadingPackageModel _$$_UserReadingPackageModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserReadingPackageModel(
      readingPackage: json['readingPackage'] == null
          ? const ReadingPackageModel()
          : ReadingPackageModel.fromJson(
              json['readingPackage'] as Map<String, dynamic>),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$$_UserReadingPackageModelToJson(
        _$_UserReadingPackageModel instance) =>
    <String, dynamic>{
      'readingPackage': instance.readingPackage,
      'startDate': instance.startDate?.toIso8601String(),
    };
