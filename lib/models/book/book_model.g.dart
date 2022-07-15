// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      id: json['id'] as int,
      name: json['name'] as String,
      decription: json['decription'] as String,
      ratingTotal: (json['ratingTotal'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toDouble(),
      numberPage: json['numberPage'] as int,
      image: json['image'] as String,
      authorName: json['authorName'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'decription': instance.decription,
      'ratingTotal': instance.ratingTotal,
      'ratingCount': instance.ratingCount,
      'numberPage': instance.numberPage,
      'image': instance.image,
      'authorName': instance.authorName,
      'categoryName': instance.categoryName,
    };
