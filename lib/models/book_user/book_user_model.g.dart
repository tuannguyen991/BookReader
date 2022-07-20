// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookUserModel _$$_BookUserModelFromJson(Map<String, dynamic> json) =>
    _$_BookUserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      decription: json['decription'] as String,
      ratingTotal: (json['ratingTotal'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toDouble(),
      numberPage: json['numberPage'] as int,
      image: json['image'] as String,
      authorName: json['authorName'] as String,
      categoryName: json['categoryName'] as String,
      lastDay: json['lastDay'] as String,
      lastPage: json['lastPage'] as String,
    );

Map<String, dynamic> _$$_BookUserModelToJson(_$_BookUserModel instance) =>
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
      'lastDay': instance.lastDay,
      'lastPage': instance.lastPage,
    };
