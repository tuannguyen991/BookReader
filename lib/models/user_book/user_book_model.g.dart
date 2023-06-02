// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBookModel _$$_UserBookModelFromJson(Map<String, dynamic> json) =>
    _$_UserBookModel(
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
      userLibrary: json['userLibrary'] == null
          ? null
          : UserLibraryModel.fromJson(
              json['userLibrary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserBookModelToJson(_$_UserBookModel instance) =>
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
      'userLibrary': instance.userLibrary,
    };
