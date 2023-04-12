// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadingPackageModel _$$_ReadingPackageModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReadingPackageModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      duration: json['duration'] == null
          ? const Duration(days: 0)
          : parseDuration((json['duration']) as String),
      price: json['price'] as int? ?? 0,
      currency: json['currency'] as int? ?? 1,
      discountPercentage: json['discountPercentage'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ReadingPackageModelToJson(
        _$_ReadingPackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'price': instance.price,
      'currency': instance.currency,
      'discountPercentage': instance.discountPercentage,
    };
