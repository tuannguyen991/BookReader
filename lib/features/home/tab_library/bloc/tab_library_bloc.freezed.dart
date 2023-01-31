// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_library_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabLibraryState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get indexChoice => throw _privateConstructorUsedError;
  List<UserBookModel> get favoriteBooks => throw _privateConstructorUsedError;
  List<UserBookModel> get readBooks => throw _privateConstructorUsedError;
  List<BookModel> get uploadBooks => throw _privateConstructorUsedError;
  bool get isGridShow => throw _privateConstructorUsedError; // just test
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabLibraryStateCopyWith<TabLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabLibraryStateCopyWith<$Res> {
  factory $TabLibraryStateCopyWith(
          TabLibraryState value, $Res Function(TabLibraryState) then) =
      _$TabLibraryStateCopyWithImpl<$Res, TabLibraryState>;
  @useResult
  $Res call(
      {bool isLoading,
      int indexChoice,
      List<UserBookModel> favoriteBooks,
      List<UserBookModel> readBooks,
      List<BookModel> uploadBooks,
      bool isGridShow,
      String url});
}

/// @nodoc
class _$TabLibraryStateCopyWithImpl<$Res, $Val extends TabLibraryState>
    implements $TabLibraryStateCopyWith<$Res> {
  _$TabLibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? indexChoice = null,
    Object? favoriteBooks = null,
    Object? readBooks = null,
    Object? uploadBooks = null,
    Object? isGridShow = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      indexChoice: null == indexChoice
          ? _value.indexChoice
          : indexChoice // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBooks: null == favoriteBooks
          ? _value.favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      readBooks: null == readBooks
          ? _value.readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      uploadBooks: null == uploadBooks
          ? _value.uploadBooks
          : uploadBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isGridShow: null == isGridShow
          ? _value.isGridShow
          : isGridShow // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabLibraryStateCopyWith<$Res>
    implements $TabLibraryStateCopyWith<$Res> {
  factory _$$_TabLibraryStateCopyWith(
          _$_TabLibraryState value, $Res Function(_$_TabLibraryState) then) =
      __$$_TabLibraryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int indexChoice,
      List<UserBookModel> favoriteBooks,
      List<UserBookModel> readBooks,
      List<BookModel> uploadBooks,
      bool isGridShow,
      String url});
}

/// @nodoc
class __$$_TabLibraryStateCopyWithImpl<$Res>
    extends _$TabLibraryStateCopyWithImpl<$Res, _$_TabLibraryState>
    implements _$$_TabLibraryStateCopyWith<$Res> {
  __$$_TabLibraryStateCopyWithImpl(
      _$_TabLibraryState _value, $Res Function(_$_TabLibraryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? indexChoice = null,
    Object? favoriteBooks = null,
    Object? readBooks = null,
    Object? uploadBooks = null,
    Object? isGridShow = null,
    Object? url = null,
  }) {
    return _then(_$_TabLibraryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      indexChoice: null == indexChoice
          ? _value.indexChoice
          : indexChoice // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBooks: null == favoriteBooks
          ? _value._favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      readBooks: null == readBooks
          ? _value._readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      uploadBooks: null == uploadBooks
          ? _value._uploadBooks
          : uploadBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isGridShow: null == isGridShow
          ? _value.isGridShow
          : isGridShow // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TabLibraryState implements _TabLibraryState {
  const _$_TabLibraryState(
      {this.isLoading = true,
      this.indexChoice = 0,
      final List<UserBookModel> favoriteBooks = const [],
      final List<UserBookModel> readBooks = const [],
      final List<BookModel> uploadBooks = const [],
      this.isGridShow = false,
      this.url = ''})
      : _favoriteBooks = favoriteBooks,
        _readBooks = readBooks,
        _uploadBooks = uploadBooks;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int indexChoice;
  final List<UserBookModel> _favoriteBooks;
  @override
  @JsonKey()
  List<UserBookModel> get favoriteBooks {
    if (_favoriteBooks is EqualUnmodifiableListView) return _favoriteBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteBooks);
  }

  final List<UserBookModel> _readBooks;
  @override
  @JsonKey()
  List<UserBookModel> get readBooks {
    if (_readBooks is EqualUnmodifiableListView) return _readBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBooks);
  }

  final List<BookModel> _uploadBooks;
  @override
  @JsonKey()
  List<BookModel> get uploadBooks {
    if (_uploadBooks is EqualUnmodifiableListView) return _uploadBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadBooks);
  }

  @override
  @JsonKey()
  final bool isGridShow;
// just test
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'TabLibraryState(isLoading: $isLoading, indexChoice: $indexChoice, favoriteBooks: $favoriteBooks, readBooks: $readBooks, uploadBooks: $uploadBooks, isGridShow: $isGridShow, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabLibraryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.indexChoice, indexChoice) ||
                other.indexChoice == indexChoice) &&
            const DeepCollectionEquality()
                .equals(other._favoriteBooks, _favoriteBooks) &&
            const DeepCollectionEquality()
                .equals(other._readBooks, _readBooks) &&
            const DeepCollectionEquality()
                .equals(other._uploadBooks, _uploadBooks) &&
            (identical(other.isGridShow, isGridShow) ||
                other.isGridShow == isGridShow) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      indexChoice,
      const DeepCollectionEquality().hash(_favoriteBooks),
      const DeepCollectionEquality().hash(_readBooks),
      const DeepCollectionEquality().hash(_uploadBooks),
      isGridShow,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabLibraryStateCopyWith<_$_TabLibraryState> get copyWith =>
      __$$_TabLibraryStateCopyWithImpl<_$_TabLibraryState>(this, _$identity);
}

abstract class _TabLibraryState implements TabLibraryState {
  const factory _TabLibraryState(
      {final bool isLoading,
      final int indexChoice,
      final List<UserBookModel> favoriteBooks,
      final List<UserBookModel> readBooks,
      final List<BookModel> uploadBooks,
      final bool isGridShow,
      final String url}) = _$_TabLibraryState;

  @override
  bool get isLoading;
  @override
  int get indexChoice;
  @override
  List<UserBookModel> get favoriteBooks;
  @override
  List<UserBookModel> get readBooks;
  @override
  List<BookModel> get uploadBooks;
  @override
  bool get isGridShow;
  @override // just test
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_TabLibraryStateCopyWith<_$_TabLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}
