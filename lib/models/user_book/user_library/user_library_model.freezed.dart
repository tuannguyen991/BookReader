// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_library_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLibraryModel _$UserLibraryModelFromJson(Map<String, dynamic> json) {
  return _UserLibraryModel.fromJson(json);
}

/// @nodoc
mixin _$UserLibraryModel {
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isReading => throw _privateConstructorUsedError;
  int get numberOfReadPages => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  DateTime? get lastRead => throw _privateConstructorUsedError;
  String get lastLocator => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLibraryModelCopyWith<UserLibraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLibraryModelCopyWith<$Res> {
  factory $UserLibraryModelCopyWith(
          UserLibraryModel value, $Res Function(UserLibraryModel) then) =
      _$UserLibraryModelCopyWithImpl<$Res, UserLibraryModel>;
  @useResult
  $Res call(
      {bool isFavorite,
      bool isReading,
      int numberOfReadPages,
      double rating,
      DateTime? lastRead,
      String lastLocator,
      String href});
}

/// @nodoc
class _$UserLibraryModelCopyWithImpl<$Res, $Val extends UserLibraryModel>
    implements $UserLibraryModelCopyWith<$Res> {
  _$UserLibraryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? isReading = null,
    Object? numberOfReadPages = null,
    Object? rating = null,
    Object? lastRead = freezed,
    Object? lastLocator = null,
    Object? href = null,
  }) {
    return _then(_value.copyWith(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isReading: null == isReading
          ? _value.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfReadPages: null == numberOfReadPages
          ? _value.numberOfReadPages
          : numberOfReadPages // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLocator: null == lastLocator
          ? _value.lastLocator
          : lastLocator // ignore: cast_nullable_to_non_nullable
              as String,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLibraryModelCopyWith<$Res>
    implements $UserLibraryModelCopyWith<$Res> {
  factory _$$_UserLibraryModelCopyWith(
          _$_UserLibraryModel value, $Res Function(_$_UserLibraryModel) then) =
      __$$_UserLibraryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFavorite,
      bool isReading,
      int numberOfReadPages,
      double rating,
      DateTime? lastRead,
      String lastLocator,
      String href});
}

/// @nodoc
class __$$_UserLibraryModelCopyWithImpl<$Res>
    extends _$UserLibraryModelCopyWithImpl<$Res, _$_UserLibraryModel>
    implements _$$_UserLibraryModelCopyWith<$Res> {
  __$$_UserLibraryModelCopyWithImpl(
      _$_UserLibraryModel _value, $Res Function(_$_UserLibraryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? isReading = null,
    Object? numberOfReadPages = null,
    Object? rating = null,
    Object? lastRead = freezed,
    Object? lastLocator = null,
    Object? href = null,
  }) {
    return _then(_$_UserLibraryModel(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isReading: null == isReading
          ? _value.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfReadPages: null == numberOfReadPages
          ? _value.numberOfReadPages
          : numberOfReadPages // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLocator: null == lastLocator
          ? _value.lastLocator
          : lastLocator // ignore: cast_nullable_to_non_nullable
              as String,
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLibraryModel implements _UserLibraryModel {
  const _$_UserLibraryModel(
      {this.isFavorite = false,
      this.isReading = false,
      this.numberOfReadPages = 0,
      this.rating = 0,
      this.lastRead,
      this.lastLocator = '',
      this.href = ''});

  factory _$_UserLibraryModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserLibraryModelFromJson(json);

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final bool isReading;
  @override
  @JsonKey()
  final int numberOfReadPages;
  @override
  @JsonKey()
  final double rating;
  @override
  final DateTime? lastRead;
  @override
  @JsonKey()
  final String lastLocator;
  @override
  @JsonKey()
  final String href;

  @override
  String toString() {
    return 'UserLibraryModel(isFavorite: $isFavorite, isReading: $isReading, numberOfReadPages: $numberOfReadPages, rating: $rating, lastRead: $lastRead, lastLocator: $lastLocator, href: $href)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLibraryModel &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isReading, isReading) ||
                other.isReading == isReading) &&
            (identical(other.numberOfReadPages, numberOfReadPages) ||
                other.numberOfReadPages == numberOfReadPages) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.lastRead, lastRead) ||
                other.lastRead == lastRead) &&
            (identical(other.lastLocator, lastLocator) ||
                other.lastLocator == lastLocator) &&
            (identical(other.href, href) || other.href == href));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFavorite, isReading,
      numberOfReadPages, rating, lastRead, lastLocator, href);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLibraryModelCopyWith<_$_UserLibraryModel> get copyWith =>
      __$$_UserLibraryModelCopyWithImpl<_$_UserLibraryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLibraryModelToJson(
      this,
    );
  }
}

abstract class _UserLibraryModel implements UserLibraryModel {
  const factory _UserLibraryModel(
      {final bool isFavorite,
      final bool isReading,
      final int numberOfReadPages,
      final double rating,
      final DateTime? lastRead,
      final String lastLocator,
      final String href}) = _$_UserLibraryModel;

  factory _UserLibraryModel.fromJson(Map<String, dynamic> json) =
      _$_UserLibraryModel.fromJson;

  @override
  bool get isFavorite;
  @override
  bool get isReading;
  @override
  int get numberOfReadPages;
  @override
  double get rating;
  @override
  DateTime? get lastRead;
  @override
  String get lastLocator;
  @override
  String get href;
  @override
  @JsonKey(ignore: true)
  _$$_UserLibraryModelCopyWith<_$_UserLibraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
