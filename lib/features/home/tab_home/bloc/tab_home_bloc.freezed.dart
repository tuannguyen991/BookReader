// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabHomeState {
  List<BookModel> get recommendedBooks => throw _privateConstructorUsedError;
  BookModel get bookItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabHomeStateCopyWith<TabHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabHomeStateCopyWith<$Res> {
  factory $TabHomeStateCopyWith(
          TabHomeState value, $Res Function(TabHomeState) then) =
      _$TabHomeStateCopyWithImpl<$Res>;
  $Res call({List<BookModel> recommendedBooks, BookModel bookItem});

  $BookModelCopyWith<$Res> get bookItem;
}

/// @nodoc
class _$TabHomeStateCopyWithImpl<$Res> implements $TabHomeStateCopyWith<$Res> {
  _$TabHomeStateCopyWithImpl(this._value, this._then);

  final TabHomeState _value;
  // ignore: unused_field
  final $Res Function(TabHomeState) _then;

  @override
  $Res call({
    Object? recommendedBooks = freezed,
    Object? bookItem = freezed,
  }) {
    return _then(_value.copyWith(
      recommendedBooks: recommendedBooks == freezed
          ? _value.recommendedBooks
          : recommendedBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      bookItem: bookItem == freezed
          ? _value.bookItem
          : bookItem // ignore: cast_nullable_to_non_nullable
              as BookModel,
    ));
  }

  @override
  $BookModelCopyWith<$Res> get bookItem {
    return $BookModelCopyWith<$Res>(_value.bookItem, (value) {
      return _then(_value.copyWith(bookItem: value));
    });
  }
}

/// @nodoc
abstract class _$$_TabHomeStateCopyWith<$Res>
    implements $TabHomeStateCopyWith<$Res> {
  factory _$$_TabHomeStateCopyWith(
          _$_TabHomeState value, $Res Function(_$_TabHomeState) then) =
      __$$_TabHomeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<BookModel> recommendedBooks, BookModel bookItem});

  @override
  $BookModelCopyWith<$Res> get bookItem;
}

/// @nodoc
class __$$_TabHomeStateCopyWithImpl<$Res>
    extends _$TabHomeStateCopyWithImpl<$Res>
    implements _$$_TabHomeStateCopyWith<$Res> {
  __$$_TabHomeStateCopyWithImpl(
      _$_TabHomeState _value, $Res Function(_$_TabHomeState) _then)
      : super(_value, (v) => _then(v as _$_TabHomeState));

  @override
  _$_TabHomeState get _value => super._value as _$_TabHomeState;

  @override
  $Res call({
    Object? recommendedBooks = freezed,
    Object? bookItem = freezed,
  }) {
    return _then(_$_TabHomeState(
      recommendedBooks: recommendedBooks == freezed
          ? _value._recommendedBooks
          : recommendedBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      bookItem: bookItem == freezed
          ? _value.bookItem
          : bookItem // ignore: cast_nullable_to_non_nullable
              as BookModel,
    ));
  }
}

/// @nodoc

class _$_TabHomeState implements _TabHomeState {
  const _$_TabHomeState(
      {final List<BookModel> recommendedBooks = const [],
      this.bookItem = const BookModel(
          authorName: '',
          categoryName: '',
          decription: '',
          id: 0,
          image: '',
          name: '',
          numberPage: 0,
          ratingCount: 0,
          ratingTotal: 0)})
      : _recommendedBooks = recommendedBooks;

  final List<BookModel> _recommendedBooks;
  @override
  @JsonKey()
  List<BookModel> get recommendedBooks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedBooks);
  }

  @override
  @JsonKey()
  final BookModel bookItem;

  @override
  String toString() {
    return 'TabHomeState(recommendedBooks: $recommendedBooks, bookItem: $bookItem)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TabHomeStateCopyWith<_$_TabHomeState> get copyWith =>
      __$$_TabHomeStateCopyWithImpl<_$_TabHomeState>(this, _$identity);
}

abstract class _TabHomeState implements TabHomeState {
  const factory _TabHomeState(
      {final List<BookModel> recommendedBooks,
      final BookModel bookItem}) = _$_TabHomeState;

  @override
  List<BookModel> get recommendedBooks;
  @override
  BookModel get bookItem;
  @override
  @JsonKey(ignore: true)
  _$$_TabHomeStateCopyWith<_$_TabHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
