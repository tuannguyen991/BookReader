// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorModel _$$_AuthorModelFromJson(Map<String, dynamic> json) =>
    _$_AuthorModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      shortBio: json['shortBio'] as String? ?? '',
      imageLink: json['imageLink'] as String? ??
          'https://www.dropbox.com/s/rv4616h4p501p6k/default.jpg?raw=1',
    );

Map<String, dynamic> _$$_AuthorModelToJson(_$_AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortBio': instance.shortBio,
      'imageLink': instance.imageLink,
    };
