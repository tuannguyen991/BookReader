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
      duration: json['duration'] as int? ?? 1,
      price: json['price'] as int? ?? 0,
      discountPercentage: json['discountPercentage'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ReadingPackageModelToJson(
        _$_ReadingPackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
    };
