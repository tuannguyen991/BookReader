// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBookModel _$UserBookModelFromJson(Map<String, dynamic> json) {
  return _UserBookModel.fromJson(json);
}

/// @nodoc
mixin _$UserBookModel {
  String get bookId => throw _privateConstructorUsedError;
  int get numberOfReadPages => throw _privateConstructorUsedError;
  DateTime? get lastRead => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get lastLocator => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String? get subTitle => throw _privateConstructorUsedError;
  int get numberOfPages => throw _privateConstructorUsedError;
  String get epubLink => throw _privateConstructorUsedError;
  String get imageLink => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<AuthorModel> get authors => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBookModelCopyWith<UserBookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBookModelCopyWith<$Res> {
  factory $UserBookModelCopyWith(
          UserBookModel value, $Res Function(UserBookModel) then) =
      _$UserBookModelCopyWithImpl<$Res, UserBookModel>;
  @useResult
  $Res call(
      {String bookId,
      int numberOfReadPages,
      DateTime? lastRead,
      double rating,
      String title,
      String lastLocator,
      String href,
      String? subTitle,
      int numberOfPages,
      String epubLink,
      String imageLink,
      double averageRating,
      String description,
      List<AuthorModel> authors,
      List<CategoryModel> categories});
}

/// @nodoc
class _$UserBookModelCopyWithImpl<$Res, $Val extends UserBookModel>
    implements $UserBookModelCopyWith<$Res> {
  _$UserBookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? numberOfReadPages = null,
    Object? lastRead = freezed,
    Object? rating = null,
    Object? title = null,
    Object? lastLocator = null,
    Object? href = null,
    Object? subTitle = freezed,
    Object? numberOfPages = null,
    Object? epubLink = null,
    Object? imageLink = null,
    Object? averageRating = null,
    Object? description = null,
    Object? authors = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfReadPages: null == numberOfReadPages
          ? _value.numberOfReadPages
          : numberOfReadPages // ignore: cast_nullable_to_non_nullable
              as int,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastLocator: null == lastLocator
          ? _value.lastLocator
          : lastLocator // ignore: cast_nullable_to_non_nullable
              as String,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      epubLink: null == epubLink
          ? _value.epubLink
          : epubLink // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserBookModelCopyWith<$Res>
    implements $UserBookModelCopyWith<$Res> {
  factory _$$_UserBookModelCopyWith(
          _$_UserBookModel value, $Res Function(_$_UserBookModel) then) =
      __$$_UserBookModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookId,
      int numberOfReadPages,
      DateTime? lastRead,
      double rating,
      String title,
      String lastLocator,
      String href,
      String? subTitle,
      int numberOfPages,
      String epubLink,
      String imageLink,
      double averageRating,
      String description,
      List<AuthorModel> authors,
      List<CategoryModel> categories});
}

/// @nodoc
class __$$_UserBookModelCopyWithImpl<$Res>
    extends _$UserBookModelCopyWithImpl<$Res, _$_UserBookModel>
    implements _$$_UserBookModelCopyWith<$Res> {
  __$$_UserBookModelCopyWithImpl(
      _$_UserBookModel _value, $Res Function(_$_UserBookModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? numberOfReadPages = null,
    Object? lastRead = freezed,
    Object? rating = null,
    Object? title = null,
    Object? lastLocator = null,
    Object? href = null,
    Object? subTitle = freezed,
    Object? numberOfPages = null,
    Object? epubLink = null,
    Object? imageLink = null,
    Object? averageRating = null,
    Object? description = null,
    Object? authors = null,
    Object? categories = null,
  }) {
    return _then(_$_UserBookModel(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfReadPages: null == numberOfReadPages
          ? _value.numberOfReadPages
          : numberOfReadPages // ignore: cast_nullable_to_non_nullable
              as int,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastLocator: null == lastLocator
          ? _value.lastLocator
          : lastLocator // ignore: cast_nullable_to_non_nullable
              as String,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      epubLink: null == epubLink
          ? _value.epubLink
          : epubLink // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserBookModel implements _UserBookModel {
  const _$_UserBookModel(
      {this.bookId = '',
      this.numberOfReadPages = 0,
      this.lastRead,
      this.rating = 0,
      this.title = 'No title',
      this.lastLocator = '',
      this.href = '',
      this.subTitle,
      this.numberOfPages = 0,
      this.epubLink = '',
      this.imageLink =
          'https://www.dropbox.com/s/jcaex2p7zxcj8vf/default.jpg?raw=1',
      this.averageRating = 0,
      this.description = 'No description',
      final List<AuthorModel> authors = const [],
      final List<CategoryModel> categories = const []})
      : _authors = authors,
        _categories = categories;

  factory _$_UserBookModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserBookModelFromJson(json);

  @override
  @JsonKey()
  final String bookId;
  @override
  @JsonKey()
  final int numberOfReadPages;
  @override
  final DateTime? lastRead;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String lastLocator;
  @override
  @JsonKey()
  final String href;
  @override
  final String? subTitle;
  @override
  @JsonKey()
  final int numberOfPages;
  @override
  @JsonKey()
  final String epubLink;
  @override
  @JsonKey()
  final String imageLink;
  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final String description;
  final List<AuthorModel> _authors;
  @override
  @JsonKey()
  List<AuthorModel> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'UserBookModel(bookId: $bookId, numberOfReadPages: $numberOfReadPages, lastRead: $lastRead, rating: $rating, title: $title, lastLocator: $lastLocator, href: $href, subTitle: $subTitle, numberOfPages: $numberOfPages, epubLink: $epubLink, imageLink: $imageLink, averageRating: $averageRating, description: $description, authors: $authors, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBookModel &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.numberOfReadPages, numberOfReadPages) ||
                other.numberOfReadPages == numberOfReadPages) &&
            (identical(other.lastRead, lastRead) ||
                other.lastRead == lastRead) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastLocator, lastLocator) ||
                other.lastLocator == lastLocator) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.epubLink, epubLink) ||
                other.epubLink == epubLink) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookId,
      numberOfReadPages,
      lastRead,
      rating,
      title,
      lastLocator,
      href,
      subTitle,
      numberOfPages,
      epubLink,
      imageLink,
      averageRating,
      description,
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBookModelCopyWith<_$_UserBookModel> get copyWith =>
      __$$_UserBookModelCopyWithImpl<_$_UserBookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBookModelToJson(
      this,
    );
  }
}

abstract class _UserBookModel implements UserBookModel {
  const factory _UserBookModel(
      {final String bookId,
      final int numberOfReadPages,
      final DateTime? lastRead,
      final double rating,
      final String title,
      final String lastLocator,
      final String href,
      final String? subTitle,
      final int numberOfPages,
      final String epubLink,
      final String imageLink,
      final double averageRating,
      final String description,
      final List<AuthorModel> authors,
      final List<CategoryModel> categories}) = _$_UserBookModel;

  factory _UserBookModel.fromJson(Map<String, dynamic> json) =
      _$_UserBookModel.fromJson;

  @override
  String get bookId;
  @override
  int get numberOfReadPages;
  @override
  DateTime? get lastRead;
  @override
  double get rating;
  @override
  String get title;
  @override
  String get lastLocator;
  @override
  String get href;
  @override
  String? get subTitle;
  @override
  int get numberOfPages;
  @override
  String get epubLink;
  @override
  String get imageLink;
  @override
  double get averageRating;
  @override
  String get description;
  @override
  List<AuthorModel> get authors;
  @override
  List<CategoryModel> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_UserBookModelCopyWith<_$_UserBookModel> get copyWith =>
      throw _privateConstructorUsedError;
}
