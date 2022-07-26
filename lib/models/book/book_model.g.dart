// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String?,
      description: json['description'] as String,
      pageCount: json['pageCount'] as int,
      averageRating: (json['averageRating'] as num).toDouble(),
      ratingsCount: json['ratingsCount'] as int,
      imageLink: json['imageLink'] as String,
      view: json['view'] as int,
      authorList: (json['authorList'] as List<dynamic>)
          .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryList: (json['categoryList'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastDay: json['lastDay'] as String?,
      lastPage: json['lastPage'] as int?,
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'averageRating': instance.averageRating,
      'ratingsCount': instance.ratingsCount,
      'imageLink': instance.imageLink,
      'view': instance.view,
      'authorList': instance.authorList,
      'categoryList': instance.categoryList,
      'lastDay': instance.lastDay,
      'lastPage': instance.lastPage,
    };
