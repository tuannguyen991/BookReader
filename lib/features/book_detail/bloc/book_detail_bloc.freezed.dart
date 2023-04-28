// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookDetailState {
  List<BookModel> get sameCategoryBooks => throw _privateConstructorUsedError;
  String get highLights => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get isFavorite => throw _privateConstructorUsedError;
  String? get locatorString => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookDetailStateCopyWith<BookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailStateCopyWith<$Res> {
  factory $BookDetailStateCopyWith(
          BookDetailState value, $Res Function(BookDetailState) then) =
      _$BookDetailStateCopyWithImpl<$Res, BookDetailState>;
  @useResult
  $Res call(
      {List<BookModel> sameCategoryBooks,
      String highLights,
      dynamic isLoading,
      dynamic isFavorite,
      String? locatorString,
      String bookId});
}

/// @nodoc
class _$BookDetailStateCopyWithImpl<$Res, $Val extends BookDetailState>
    implements $BookDetailStateCopyWith<$Res> {
  _$BookDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sameCategoryBooks = null,
    Object? highLights = null,
    Object? isLoading = freezed,
    Object? isFavorite = freezed,
    Object? locatorString = freezed,
    Object? bookId = null,
  }) {
    return _then(_value.copyWith(
      sameCategoryBooks: null == sameCategoryBooks
          ? _value.sameCategoryBooks
          : sameCategoryBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      highLights: null == highLights
          ? _value.highLights
          : highLights // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locatorString: freezed == locatorString
          ? _value.locatorString
          : locatorString // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookDetailStateCopyWith<$Res>
    implements $BookDetailStateCopyWith<$Res> {
  factory _$$_BookDetailStateCopyWith(
          _$_BookDetailState value, $Res Function(_$_BookDetailState) then) =
      __$$_BookDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookModel> sameCategoryBooks,
      String highLights,
      dynamic isLoading,
      dynamic isFavorite,
      String? locatorString,
      String bookId});
}

/// @nodoc
class __$$_BookDetailStateCopyWithImpl<$Res>
    extends _$BookDetailStateCopyWithImpl<$Res, _$_BookDetailState>
    implements _$$_BookDetailStateCopyWith<$Res> {
  __$$_BookDetailStateCopyWithImpl(
      _$_BookDetailState _value, $Res Function(_$_BookDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sameCategoryBooks = null,
    Object? highLights = null,
    Object? isLoading = freezed,
    Object? isFavorite = freezed,
    Object? locatorString = freezed,
    Object? bookId = null,
  }) {
    return _then(_$_BookDetailState(
      sameCategoryBooks: null == sameCategoryBooks
          ? _value._sameCategoryBooks
          : sameCategoryBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      highLights: null == highLights
          ? _value.highLights
          : highLights // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      isFavorite: freezed == isFavorite ? _value.isFavorite! : isFavorite,
      locatorString: freezed == locatorString
          ? _value.locatorString
          : locatorString // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BookDetailState implements _BookDetailState {
  const _$_BookDetailState(
      {final List<BookModel> sameCategoryBooks = const [],
      this.highLights = '',
      this.isLoading = true,
      this.isFavorite = false,
      this.locatorString = null,
      this.bookId = ''})
      : _sameCategoryBooks = sameCategoryBooks;

  final List<BookModel> _sameCategoryBooks;
  @override
  @JsonKey()
  List<BookModel> get sameCategoryBooks {
    if (_sameCategoryBooks is EqualUnmodifiableListView)
      return _sameCategoryBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sameCategoryBooks);
  }

  @override
  @JsonKey()
  final String highLights;
  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  @JsonKey()
  final dynamic isFavorite;
  @override
  @JsonKey()
  final String? locatorString;
  @override
  @JsonKey()
  final String bookId;

  @override
  String toString() {
    return 'BookDetailState(sameCategoryBooks: $sameCategoryBooks, highLights: $highLights, isLoading: $isLoading, isFavorite: $isFavorite, locatorString: $locatorString, bookId: $bookId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookDetailState &&
            const DeepCollectionEquality()
                .equals(other._sameCategoryBooks, _sameCategoryBooks) &&
            (identical(other.highLights, highLights) ||
                other.highLights == highLights) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite) &&
            (identical(other.locatorString, locatorString) ||
                other.locatorString == locatorString) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sameCategoryBooks),
      highLights,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isFavorite),
      locatorString,
      bookId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookDetailStateCopyWith<_$_BookDetailState> get copyWith =>
      __$$_BookDetailStateCopyWithImpl<_$_BookDetailState>(this, _$identity);
}

abstract class _BookDetailState implements BookDetailState {
  const factory _BookDetailState(
      {final List<BookModel> sameCategoryBooks,
      final String highLights,
      final dynamic isLoading,
      final dynamic isFavorite,
      final String? locatorString,
      final String bookId}) = _$_BookDetailState;

  @override
  List<BookModel> get sameCategoryBooks;
  @override
  String get highLights;
  @override
  dynamic get isLoading;
  @override
  dynamic get isFavorite;
  @override
  String? get locatorString;
  @override
  String get bookId;
  @override
  @JsonKey(ignore: true)
  _$$_BookDetailStateCopyWith<_$_BookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
