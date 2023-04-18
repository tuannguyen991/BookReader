// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabHomeState {
  ///
  List<BookModel> get recommendedBooks => throw _privateConstructorUsedError; //
  BookModel get bookItem => throw _privateConstructorUsedError; //
  UserModel get user => throw _privateConstructorUsedError; //
  UserBookModel? get lastBook => throw _privateConstructorUsedError; //
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabHomeStateCopyWith<TabHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabHomeStateCopyWith<$Res> {
  factory $TabHomeStateCopyWith(
          TabHomeState value, $Res Function(TabHomeState) then) =
      _$TabHomeStateCopyWithImpl<$Res, TabHomeState>;
  @useResult
  $Res call(
      {List<BookModel> recommendedBooks,
      BookModel bookItem,
      UserModel user,
      UserBookModel? lastBook,
      bool isLoading});

  $BookModelCopyWith<$Res> get bookItem;
  $UserModelCopyWith<$Res> get user;
  $UserBookModelCopyWith<$Res>? get lastBook;
}

/// @nodoc
class _$TabHomeStateCopyWithImpl<$Res, $Val extends TabHomeState>
    implements $TabHomeStateCopyWith<$Res> {
  _$TabHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedBooks = null,
    Object? bookItem = null,
    Object? user = null,
    Object? lastBook = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      recommendedBooks: null == recommendedBooks
          ? _value.recommendedBooks
          : recommendedBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      bookItem: null == bookItem
          ? _value.bookItem
          : bookItem // ignore: cast_nullable_to_non_nullable
              as BookModel,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      lastBook: freezed == lastBook
          ? _value.lastBook
          : lastBook // ignore: cast_nullable_to_non_nullable
              as UserBookModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookModelCopyWith<$Res> get bookItem {
    return $BookModelCopyWith<$Res>(_value.bookItem, (value) {
      return _then(_value.copyWith(bookItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserBookModelCopyWith<$Res>? get lastBook {
    if (_value.lastBook == null) {
      return null;
    }

    return $UserBookModelCopyWith<$Res>(_value.lastBook!, (value) {
      return _then(_value.copyWith(lastBook: value) as $Val);
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
  @useResult
  $Res call(
      {List<BookModel> recommendedBooks,
      BookModel bookItem,
      UserModel user,
      UserBookModel? lastBook,
      bool isLoading});

  @override
  $BookModelCopyWith<$Res> get bookItem;
  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $UserBookModelCopyWith<$Res>? get lastBook;
}

/// @nodoc
class __$$_TabHomeStateCopyWithImpl<$Res>
    extends _$TabHomeStateCopyWithImpl<$Res, _$_TabHomeState>
    implements _$$_TabHomeStateCopyWith<$Res> {
  __$$_TabHomeStateCopyWithImpl(
      _$_TabHomeState _value, $Res Function(_$_TabHomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedBooks = null,
    Object? bookItem = null,
    Object? user = null,
    Object? lastBook = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_TabHomeState(
      recommendedBooks: null == recommendedBooks
          ? _value._recommendedBooks
          : recommendedBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      bookItem: null == bookItem
          ? _value.bookItem
          : bookItem // ignore: cast_nullable_to_non_nullable
              as BookModel,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      lastBook: freezed == lastBook
          ? _value.lastBook
          : lastBook // ignore: cast_nullable_to_non_nullable
              as UserBookModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TabHomeState implements _TabHomeState {
  const _$_TabHomeState(
      {final List<BookModel> recommendedBooks = const [],
      this.bookItem = const BookModel(),
      this.user = const UserModel(),
      this.lastBook,
      this.isLoading = true})
      : _recommendedBooks = recommendedBooks;

  ///
  final List<BookModel> _recommendedBooks;

  ///
  @override
  @JsonKey()
  List<BookModel> get recommendedBooks {
    if (_recommendedBooks is EqualUnmodifiableListView)
      return _recommendedBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedBooks);
  }

//
  @override
  @JsonKey()
  final BookModel bookItem;
//
  @override
  @JsonKey()
  final UserModel user;
//
  @override
  final UserBookModel? lastBook;
//
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TabHomeState(recommendedBooks: $recommendedBooks, bookItem: $bookItem, user: $user, lastBook: $lastBook, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabHomeState &&
            const DeepCollectionEquality()
                .equals(other._recommendedBooks, _recommendedBooks) &&
            (identical(other.bookItem, bookItem) ||
                other.bookItem == bookItem) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lastBook, lastBook) ||
                other.lastBook == lastBook) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recommendedBooks),
      bookItem,
      user,
      lastBook,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabHomeStateCopyWith<_$_TabHomeState> get copyWith =>
      __$$_TabHomeStateCopyWithImpl<_$_TabHomeState>(this, _$identity);
}

abstract class _TabHomeState implements TabHomeState {
  const factory _TabHomeState(
      {final List<BookModel> recommendedBooks,
      final BookModel bookItem,
      final UserModel user,
      final UserBookModel? lastBook,
      final bool isLoading}) = _$_TabHomeState;

  @override

  ///
  List<BookModel> get recommendedBooks;
  @override //
  BookModel get bookItem;
  @override //
  UserModel get user;
  @override //
  UserBookModel? get lastBook;
  @override //
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_TabHomeStateCopyWith<_$_TabHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
