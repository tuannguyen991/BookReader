// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookDetailStateCopyWith<BookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailStateCopyWith<$Res> {
  factory $BookDetailStateCopyWith(
          BookDetailState value, $Res Function(BookDetailState) then) =
      _$BookDetailStateCopyWithImpl<$Res>;
  $Res call(
      {List<BookModel> sameCategoryBooks,
      dynamic isLoading,
      dynamic isFavorite});
}

/// @nodoc
class _$BookDetailStateCopyWithImpl<$Res>
    implements $BookDetailStateCopyWith<$Res> {
  _$BookDetailStateCopyWithImpl(this._value, this._then);

  final BookDetailState _value;
  // ignore: unused_field
  final $Res Function(BookDetailState) _then;

  @override
  $Res call({
    Object? sameCategoryBooks = freezed,
    Object? isLoading = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      sameCategoryBooks: sameCategoryBooks == freezed
          ? _value.sameCategoryBooks
          : sameCategoryBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_BookDetailStateCopyWith<$Res>
    implements $BookDetailStateCopyWith<$Res> {
  factory _$$_BookDetailStateCopyWith(
          _$_BookDetailState value, $Res Function(_$_BookDetailState) then) =
      __$$_BookDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BookModel> sameCategoryBooks,
      dynamic isLoading,
      dynamic isFavorite});
}

/// @nodoc
class __$$_BookDetailStateCopyWithImpl<$Res>
    extends _$BookDetailStateCopyWithImpl<$Res>
    implements _$$_BookDetailStateCopyWith<$Res> {
  __$$_BookDetailStateCopyWithImpl(
      _$_BookDetailState _value, $Res Function(_$_BookDetailState) _then)
      : super(_value, (v) => _then(v as _$_BookDetailState));

  @override
  _$_BookDetailState get _value => super._value as _$_BookDetailState;

  @override
  $Res call({
    Object? sameCategoryBooks = freezed,
    Object? isLoading = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$_BookDetailState(
      sameCategoryBooks: sameCategoryBooks == freezed
          ? _value._sameCategoryBooks
          : sameCategoryBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading,
      isFavorite: isFavorite == freezed ? _value.isFavorite : isFavorite,
    ));
  }
}

/// @nodoc

class _$_BookDetailState implements _BookDetailState {
  const _$_BookDetailState(
      {final List<BookModel> sameCategoryBooks = const [],
      this.isLoading = true,
      this.isFavorite = false})
      : _sameCategoryBooks = sameCategoryBooks;

  final List<BookModel> _sameCategoryBooks;
  @override
  @JsonKey()
  List<BookModel> get sameCategoryBooks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sameCategoryBooks);
  }

  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  @JsonKey()
  final dynamic isFavorite;

  @override
  String toString() {
    return 'BookDetailState(sameCategoryBooks: $sameCategoryBooks, isLoading: $isLoading, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookDetailState &&
            const DeepCollectionEquality()
                .equals(other._sameCategoryBooks, _sameCategoryBooks) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sameCategoryBooks),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$_BookDetailStateCopyWith<_$_BookDetailState> get copyWith =>
      __$$_BookDetailStateCopyWithImpl<_$_BookDetailState>(this, _$identity);
}

abstract class _BookDetailState implements BookDetailState {
  const factory _BookDetailState(
      {final List<BookModel> sameCategoryBooks,
      final dynamic isLoading,
      final dynamic isFavorite}) = _$_BookDetailState;

  @override
  List<BookModel> get sameCategoryBooks;
  @override
  dynamic get isLoading;
  @override
  dynamic get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_BookDetailStateCopyWith<_$_BookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
