// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      name: json['name'] as String,
      authorId: json['authorId'] as String,
      rating: (json['rating'] as num).toDouble(),
      bookUrl: json['bookUrl'] as String,
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'authorId': instance.authorId,
      'rating': instance.rating,
      'bookUrl': instance.bookUrl,
    };
