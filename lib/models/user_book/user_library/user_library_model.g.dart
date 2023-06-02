// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLibraryModel _$$_UserLibraryModelFromJson(Map<String, dynamic> json) =>
    _$_UserLibraryModel(
      isFavorite: json['isFavorite'] as bool? ?? false,
      isReading: json['isReading'] as bool? ?? false,
      numberOfReadPages: json['numberOfReadPages'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      lastRead: json['lastRead'] == null
          ? null
          : DateTime.parse(json['lastRead'] as String),
      lastLocator: json['lastLocator'] as String? ?? '',
      href: json['href'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserLibraryModelToJson(_$_UserLibraryModel instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'isReading': instance.isReading,
      'numberOfReadPages': instance.numberOfReadPages,
      'rating': instance.rating,
      'lastRead': instance.lastRead?.toIso8601String(),
      'lastLocator': instance.lastLocator,
      'href': instance.href,
    };
