// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBookModel _$$_UserBookModelFromJson(Map<String, dynamic> json) =>
    _$_UserBookModel(
      bookId: json['bookId'] as String? ?? '',
      numberOfReadPages: json['numberOfReadPages'] as int? ?? 0,
      lastRead: json['lastRead'] == null
          ? null
          : DateTime.parse(json['lastRead'] as String),
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      title: json['title'] as String? ?? 'No title',
      lastLocator: json['lastLocator'] as String? ?? '',
      href: json['href'] as String? ?? '',
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

Map<String, dynamic> _$$_UserBookModelToJson(_$_UserBookModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'numberOfReadPages': instance.numberOfReadPages,
      'lastRead': instance.lastRead?.toIso8601String(),
      'rating': instance.rating,
      'title': instance.title,
      'lastLocator': instance.lastLocator,
      'href': instance.href,
      'subTitle': instance.subTitle,
      'numberOfPages': instance.numberOfPages,
      'epubLink': instance.epubLink,
      'imageLink': instance.imageLink,
      'averageRating': instance.averageRating,
      'description': instance.description,
      'authors': instance.authors,
      'categories': instance.categories,
    };
