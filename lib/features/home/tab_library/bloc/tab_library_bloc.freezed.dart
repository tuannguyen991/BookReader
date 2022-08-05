// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  List<BookModel> get favoriteBooks => throw _privateConstructorUsedError;
  List<BookModel> get readBooks => throw _privateConstructorUsedError;
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
      _$TabLibraryStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      int indexChoice,
      List<BookModel> favoriteBooks,
      List<BookModel> readBooks,
      List<BookModel> uploadBooks,
      bool isGridShow,
      String url});
}

/// @nodoc
class _$TabLibraryStateCopyWithImpl<$Res>
    implements $TabLibraryStateCopyWith<$Res> {
  _$TabLibraryStateCopyWithImpl(this._value, this._then);

  final TabLibraryState _value;
  // ignore: unused_field
  final $Res Function(TabLibraryState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? indexChoice = freezed,
    Object? favoriteBooks = freezed,
    Object? readBooks = freezed,
    Object? uploadBooks = freezed,
    Object? isGridShow = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      indexChoice: indexChoice == freezed
          ? _value.indexChoice
          : indexChoice // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBooks: favoriteBooks == freezed
          ? _value.favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      readBooks: readBooks == freezed
          ? _value.readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      uploadBooks: uploadBooks == freezed
          ? _value.uploadBooks
          : uploadBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isGridShow: isGridShow == freezed
          ? _value.isGridShow
          : isGridShow // ignore: cast_nullable_to_non_nullable
              as bool,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TabLibraryStateCopyWith<$Res>
    implements $TabLibraryStateCopyWith<$Res> {
  factory _$$_TabLibraryStateCopyWith(
          _$_TabLibraryState value, $Res Function(_$_TabLibraryState) then) =
      __$$_TabLibraryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      int indexChoice,
      List<BookModel> favoriteBooks,
      List<BookModel> readBooks,
      List<BookModel> uploadBooks,
      bool isGridShow,
      String url});
}

/// @nodoc
class __$$_TabLibraryStateCopyWithImpl<$Res>
    extends _$TabLibraryStateCopyWithImpl<$Res>
    implements _$$_TabLibraryStateCopyWith<$Res> {
  __$$_TabLibraryStateCopyWithImpl(
      _$_TabLibraryState _value, $Res Function(_$_TabLibraryState) _then)
      : super(_value, (v) => _then(v as _$_TabLibraryState));

  @override
  _$_TabLibraryState get _value => super._value as _$_TabLibraryState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? indexChoice = freezed,
    Object? favoriteBooks = freezed,
    Object? readBooks = freezed,
    Object? uploadBooks = freezed,
    Object? isGridShow = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_TabLibraryState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      indexChoice: indexChoice == freezed
          ? _value.indexChoice
          : indexChoice // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBooks: favoriteBooks == freezed
          ? _value._favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      readBooks: readBooks == freezed
          ? _value._readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      uploadBooks: uploadBooks == freezed
          ? _value._uploadBooks
          : uploadBooks // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      isGridShow: isGridShow == freezed
          ? _value.isGridShow
          : isGridShow // ignore: cast_nullable_to_non_nullable
              as bool,
      url: url == freezed
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
      final List<BookModel> favoriteBooks = const [],
      final List<BookModel> readBooks = const [],
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
  final List<BookModel> _favoriteBooks;
  @override
  @JsonKey()
  List<BookModel> get favoriteBooks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteBooks);
  }

  final List<BookModel> _readBooks;
  @override
  @JsonKey()
  List<BookModel> get readBooks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBooks);
  }

  final List<BookModel> _uploadBooks;
  @override
  @JsonKey()
  List<BookModel> get uploadBooks {
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
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.indexChoice, indexChoice) &&
            const DeepCollectionEquality()
                .equals(other._favoriteBooks, _favoriteBooks) &&
            const DeepCollectionEquality()
                .equals(other._readBooks, _readBooks) &&
            const DeepCollectionEquality()
                .equals(other._uploadBooks, _uploadBooks) &&
            const DeepCollectionEquality()
                .equals(other.isGridShow, isGridShow) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(indexChoice),
      const DeepCollectionEquality().hash(_favoriteBooks),
      const DeepCollectionEquality().hash(_readBooks),
      const DeepCollectionEquality().hash(_uploadBooks),
      const DeepCollectionEquality().hash(isGridShow),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_TabLibraryStateCopyWith<_$_TabLibraryState> get copyWith =>
      __$$_TabLibraryStateCopyWithImpl<_$_TabLibraryState>(this, _$identity);
}

abstract class _TabLibraryState implements TabLibraryState {
  const factory _TabLibraryState(
      {final bool isLoading,
      final int indexChoice,
      final List<BookModel> favoriteBooks,
      final List<BookModel> readBooks,
      final List<BookModel> uploadBooks,
      final bool isGridShow,
      final String url}) = _$_TabLibraryState;

  @override
  bool get isLoading;
  @override
  int get indexChoice;
  @override
  List<BookModel> get favoriteBooks;
  @override
  List<BookModel> get readBooks;
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
