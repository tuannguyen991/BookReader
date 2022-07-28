// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorModel _$$_AuthorModelFromJson(Map<String, dynamic> json) =>
    _$_AuthorModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageLink: json['imageLink'] as String? ?? '',
    );

Map<String, dynamic> _$$_AuthorModelToJson(_$_AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageLink': instance.imageLink,
    };
