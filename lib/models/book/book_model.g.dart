// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'No title',
      subTitle: json['subTitle'] as String?,
      description: json['description'] as String? ?? 'No description',
      pageCount: json['pageCount'] as int? ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      ratingsCount: json['ratingsCount'] as int? ?? 0,
      imageLink: json['imageLink'] as String? ??
          'https://truyentr.org/assets/images/default.jpg',
      view: json['view'] as int? ?? 0,
      authorList: (json['authorList'] as List<dynamic>?)
              ?.map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categoryList: (json['categoryList'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastDay: json['lastDay'] as String?,
      lastPage: json['lastPage'] as int?,
      isFile: json['isFile'] as bool? ?? false,
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
      'authorList': BookModel._authorListToJson(instance.authorList),
      'categoryList': instance.categoryList,
      'lastDay': instance.lastDay,
      'lastPage': instance.lastPage,
      'isFile': instance.isFile,
    };
