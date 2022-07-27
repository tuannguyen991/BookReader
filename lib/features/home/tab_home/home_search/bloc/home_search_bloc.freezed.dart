// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get history => throw _privateConstructorUsedError;
  List<CategoryModel> get listCategory => throw _privateConstructorUsedError;
  List<BookModel> get listBook => throw _privateConstructorUsedError;
  List<AuthorModel> get listAuthor => throw _privateConstructorUsedError;
  List<dynamic> get listRecommendedByName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSearchStateCopyWith<HomeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSearchStateCopyWith<$Res> {
  factory $HomeSearchStateCopyWith(
          HomeSearchState value, $Res Function(HomeSearchState) then) =
      _$HomeSearchStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<String> history,
      List<CategoryModel> listCategory,
      List<BookModel> listBook,
      List<AuthorModel> listAuthor,
      List<dynamic> listRecommendedByName});
}

/// @nodoc
class _$HomeSearchStateCopyWithImpl<$Res>
    implements $HomeSearchStateCopyWith<$Res> {
  _$HomeSearchStateCopyWithImpl(this._value, this._then);

  final HomeSearchState _value;
  // ignore: unused_field
  final $Res Function(HomeSearchState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? history = freezed,
    Object? listCategory = freezed,
    Object? listBook = freezed,
    Object? listAuthor = freezed,
    Object? listRecommendedByName = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listCategory: listCategory == freezed
          ? _value.listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      listBook: listBook == freezed
          ? _value.listBook
          : listBook // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      listAuthor: listAuthor == freezed
          ? _value.listAuthor
          : listAuthor // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      listRecommendedByName: listRecommendedByName == freezed
          ? _value.listRecommendedByName
          : listRecommendedByName // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeSearchStateCopyWith<$Res>
    implements $HomeSearchStateCopyWith<$Res> {
  factory _$$_HomeSearchStateCopyWith(
          _$_HomeSearchState value, $Res Function(_$_HomeSearchState) then) =
      __$$_HomeSearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<String> history,
      List<CategoryModel> listCategory,
      List<BookModel> listBook,
      List<AuthorModel> listAuthor,
      List<dynamic> listRecommendedByName});
}

/// @nodoc
class __$$_HomeSearchStateCopyWithImpl<$Res>
    extends _$HomeSearchStateCopyWithImpl<$Res>
    implements _$$_HomeSearchStateCopyWith<$Res> {
  __$$_HomeSearchStateCopyWithImpl(
      _$_HomeSearchState _value, $Res Function(_$_HomeSearchState) _then)
      : super(_value, (v) => _then(v as _$_HomeSearchState));

  @override
  _$_HomeSearchState get _value => super._value as _$_HomeSearchState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? history = freezed,
    Object? listCategory = freezed,
    Object? listBook = freezed,
    Object? listAuthor = freezed,
    Object? listRecommendedByName = freezed,
  }) {
    return _then(_$_HomeSearchState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: history == freezed
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listCategory: listCategory == freezed
          ? _value._listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      listBook: listBook == freezed
          ? _value._listBook
          : listBook // ignore: cast_nullable_to_non_nullable
              as List<BookModel>,
      listAuthor: listAuthor == freezed
          ? _value._listAuthor
          : listAuthor // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      listRecommendedByName: listRecommendedByName == freezed
          ? _value._listRecommendedByName
          : listRecommendedByName // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_HomeSearchState implements _HomeSearchState {
  const _$_HomeSearchState(
      {this.isLoading = true,
      final List<String> history = const [],
      final List<CategoryModel> listCategory = const [],
      final List<BookModel> listBook = const [],
      final List<AuthorModel> listAuthor = const [],
      final List<dynamic> listRecommendedByName = const []})
      : _history = history,
        _listCategory = listCategory,
        _listBook = listBook,
        _listAuthor = listAuthor,
        _listRecommendedByName = listRecommendedByName;

  @override
  @JsonKey()
  final bool isLoading;
  final List<String> _history;
  @override
  @JsonKey()
  List<String> get history {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<CategoryModel> _listCategory;
  @override
  @JsonKey()
  List<CategoryModel> get listCategory {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategory);
  }

  final List<BookModel> _listBook;
  @override
  @JsonKey()
  List<BookModel> get listBook {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBook);
  }

  final List<AuthorModel> _listAuthor;
  @override
  @JsonKey()
  List<AuthorModel> get listAuthor {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listAuthor);
  }

  final List<dynamic> _listRecommendedByName;
  @override
  @JsonKey()
  List<dynamic> get listRecommendedByName {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRecommendedByName);
  }

  @override
  String toString() {
    return 'HomeSearchState(isLoading: $isLoading, history: $history, listCategory: $listCategory, listBook: $listBook, listAuthor: $listAuthor, listRecommendedByName: $listRecommendedByName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeSearchState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other._listCategory, _listCategory) &&
            const DeepCollectionEquality().equals(other._listBook, _listBook) &&
            const DeepCollectionEquality()
                .equals(other._listAuthor, _listAuthor) &&
            const DeepCollectionEquality()
                .equals(other._listRecommendedByName, _listRecommendedByName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_listCategory),
      const DeepCollectionEquality().hash(_listBook),
      const DeepCollectionEquality().hash(_listAuthor),
      const DeepCollectionEquality().hash(_listRecommendedByName));

  @JsonKey(ignore: true)
  @override
  _$$_HomeSearchStateCopyWith<_$_HomeSearchState> get copyWith =>
      __$$_HomeSearchStateCopyWithImpl<_$_HomeSearchState>(this, _$identity);
}

abstract class _HomeSearchState implements HomeSearchState {
  const factory _HomeSearchState(
      {final bool isLoading,
      final List<String> history,
      final List<CategoryModel> listCategory,
      final List<BookModel> listBook,
      final List<AuthorModel> listAuthor,
      final List<dynamic> listRecommendedByName}) = _$_HomeSearchState;

  @override
  bool get isLoading;
  @override
  List<String> get history;
  @override
  List<CategoryModel> get listCategory;
  @override
  List<BookModel> get listBook;
  @override
  List<AuthorModel> get listAuthor;
  @override
  List<dynamic> get listRecommendedByName;
  @override
  @JsonKey(ignore: true)
  _$$_HomeSearchStateCopyWith<_$_HomeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
