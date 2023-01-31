// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'No title',
      subTitle: json['subTitle'] as String?,
      numberOfPages: json['numberOfPages'] as int? ?? 0,
      epubLink: json['epubLink'] as String? ?? '',
      imageLink: json['imageLink'] as String? ??
          'https://www.dropbox.com/s/jcaex2p7zxcj8vf/default.jpg?raw=1',
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? 'No description',
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'numberOfPages': instance.numberOfPages,
      'epubLink': instance.epubLink,
      'imageLink': instance.imageLink,
      'averageRating': instance.averageRating,
      'description': instance.description,
      'authors': instance.authors,
      'categories': instance.categories,
    };
