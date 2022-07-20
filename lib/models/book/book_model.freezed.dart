// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _BookModel.fromJson(json);
}

/// @nodoc
mixin _$BookModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get decription => throw _privateConstructorUsedError;
  double get ratingTotal => throw _privateConstructorUsedError;
  double get ratingCount => throw _privateConstructorUsedError;
  int get numberPage => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String decription,
      double ratingTotal,
      double ratingCount,
      int numberPage,
      String image,
      String authorName,
      String categoryName});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res> implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  final BookModel _value;
  // ignore: unused_field
  final $Res Function(BookModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? decription = freezed,
    Object? ratingTotal = freezed,
    Object? ratingCount = freezed,
    Object? numberPage = freezed,
    Object? image = freezed,
    Object? authorName = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decription: decription == freezed
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String,
      ratingTotal: ratingTotal == freezed
          ? _value.ratingTotal
          : ratingTotal // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: ratingCount == freezed
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as double,
      numberPage: numberPage == freezed
          ? _value.numberPage
          : numberPage // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$$_BookModelCopyWith(
          _$_BookModel value, $Res Function(_$_BookModel) then) =
      __$$_BookModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String decription,
      double ratingTotal,
      double ratingCount,
      int numberPage,
      String image,
      String authorName,
      String categoryName});
}

/// @nodoc
class __$$_BookModelCopyWithImpl<$Res> extends _$BookModelCopyWithImpl<$Res>
    implements _$$_BookModelCopyWith<$Res> {
  __$$_BookModelCopyWithImpl(
      _$_BookModel _value, $Res Function(_$_BookModel) _then)
      : super(_value, (v) => _then(v as _$_BookModel));

  @override
  _$_BookModel get _value => super._value as _$_BookModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? decription = freezed,
    Object? ratingTotal = freezed,
    Object? ratingCount = freezed,
    Object? numberPage = freezed,
    Object? image = freezed,
    Object? authorName = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$_BookModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decription: decription == freezed
          ? _value.decription
          : decription // ignore: cast_nullable_to_non_nullable
              as String,
      ratingTotal: ratingTotal == freezed
          ? _value.ratingTotal
          : ratingTotal // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: ratingCount == freezed
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as double,
      numberPage: numberPage == freezed
          ? _value.numberPage
          : numberPage // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookModel implements _BookModel {
  const _$_BookModel(
      {required this.id,
      required this.name,
      required this.decription,
      required this.ratingTotal,
      required this.ratingCount,
      required this.numberPage,
      required this.image,
      required this.authorName,
      required this.categoryName});

  factory _$_BookModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String decription;
  @override
  final double ratingTotal;
  @override
  final double ratingCount;
  @override
  final int numberPage;
  @override
  final String image;
  @override
  final String authorName;
  @override
  final String categoryName;

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, decription: $decription, ratingTotal: $ratingTotal, ratingCount: $ratingCount, numberPage: $numberPage, image: $image, authorName: $authorName, categoryName: $categoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.decription, decription) &&
            const DeepCollectionEquality()
                .equals(other.ratingTotal, ratingTotal) &&
            const DeepCollectionEquality()
                .equals(other.ratingCount, ratingCount) &&
            const DeepCollectionEquality()
                .equals(other.numberPage, numberPage) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.authorName, authorName) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(decription),
      const DeepCollectionEquality().hash(ratingTotal),
      const DeepCollectionEquality().hash(ratingCount),
      const DeepCollectionEquality().hash(numberPage),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(authorName),
      const DeepCollectionEquality().hash(categoryName));

  @JsonKey(ignore: true)
  @override
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      __$$_BookModelCopyWithImpl<_$_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookModelToJson(this);
  }
}

abstract class _BookModel implements BookModel {
  const factory _BookModel(
      {required final int id,
      required final String name,
      required final String decription,
      required final double ratingTotal,
      required final double ratingCount,
      required final int numberPage,
      required final String image,
      required final String authorName,
      required final String categoryName}) = _$_BookModel;

  factory _BookModel.fromJson(Map<String, dynamic> json) =
      _$_BookModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get decription;
  @override
  double get ratingTotal;
  @override
  double get ratingCount;
  @override
  int get numberPage;
  @override
  String get image;
  @override
  String get authorName;
  @override
  String get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}
