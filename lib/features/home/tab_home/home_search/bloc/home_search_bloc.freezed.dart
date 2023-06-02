// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  List<UserBookModel> get listBook => throw _privateConstructorUsedError;
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
      _$HomeSearchStateCopyWithImpl<$Res, HomeSearchState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<String> history,
      List<CategoryModel> listCategory,
      List<UserBookModel> listBook,
      List<AuthorModel> listAuthor,
      List<dynamic> listRecommendedByName});
}

/// @nodoc
class _$HomeSearchStateCopyWithImpl<$Res, $Val extends HomeSearchState>
    implements $HomeSearchStateCopyWith<$Res> {
  _$HomeSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? history = null,
    Object? listCategory = null,
    Object? listBook = null,
    Object? listAuthor = null,
    Object? listRecommendedByName = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listCategory: null == listCategory
          ? _value.listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      listBook: null == listBook
          ? _value.listBook
          : listBook // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      listAuthor: null == listAuthor
          ? _value.listAuthor
          : listAuthor // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      listRecommendedByName: null == listRecommendedByName
          ? _value.listRecommendedByName
          : listRecommendedByName // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeSearchStateCopyWith<$Res>
    implements $HomeSearchStateCopyWith<$Res> {
  factory _$$_HomeSearchStateCopyWith(
          _$_HomeSearchState value, $Res Function(_$_HomeSearchState) then) =
      __$$_HomeSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<String> history,
      List<CategoryModel> listCategory,
      List<UserBookModel> listBook,
      List<AuthorModel> listAuthor,
      List<dynamic> listRecommendedByName});
}

/// @nodoc
class __$$_HomeSearchStateCopyWithImpl<$Res>
    extends _$HomeSearchStateCopyWithImpl<$Res, _$_HomeSearchState>
    implements _$$_HomeSearchStateCopyWith<$Res> {
  __$$_HomeSearchStateCopyWithImpl(
      _$_HomeSearchState _value, $Res Function(_$_HomeSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? history = null,
    Object? listCategory = null,
    Object? listBook = null,
    Object? listAuthor = null,
    Object? listRecommendedByName = null,
  }) {
    return _then(_$_HomeSearchState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listCategory: null == listCategory
          ? _value._listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      listBook: null == listBook
          ? _value._listBook
          : listBook // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
      listAuthor: null == listAuthor
          ? _value._listAuthor
          : listAuthor // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      listRecommendedByName: null == listRecommendedByName
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
      final List<UserBookModel> listBook = const [],
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
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<CategoryModel> _listCategory;
  @override
  @JsonKey()
  List<CategoryModel> get listCategory {
    if (_listCategory is EqualUnmodifiableListView) return _listCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategory);
  }

  final List<UserBookModel> _listBook;
  @override
  @JsonKey()
  List<UserBookModel> get listBook {
    if (_listBook is EqualUnmodifiableListView) return _listBook;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBook);
  }

  final List<AuthorModel> _listAuthor;
  @override
  @JsonKey()
  List<AuthorModel> get listAuthor {
    if (_listAuthor is EqualUnmodifiableListView) return _listAuthor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listAuthor);
  }

  final List<dynamic> _listRecommendedByName;
  @override
  @JsonKey()
  List<dynamic> get listRecommendedByName {
    if (_listRecommendedByName is EqualUnmodifiableListView)
      return _listRecommendedByName;
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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
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
      isLoading,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_listCategory),
      const DeepCollectionEquality().hash(_listBook),
      const DeepCollectionEquality().hash(_listAuthor),
      const DeepCollectionEquality().hash(_listRecommendedByName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeSearchStateCopyWith<_$_HomeSearchState> get copyWith =>
      __$$_HomeSearchStateCopyWithImpl<_$_HomeSearchState>(this, _$identity);
}

abstract class _HomeSearchState implements HomeSearchState {
  const factory _HomeSearchState(
      {final bool isLoading,
      final List<String> history,
      final List<CategoryModel> listCategory,
      final List<UserBookModel> listBook,
      final List<AuthorModel> listAuthor,
      final List<dynamic> listRecommendedByName}) = _$_HomeSearchState;

  @override
  bool get isLoading;
  @override
  List<String> get history;
  @override
  List<CategoryModel> get listCategory;
  @override
  List<UserBookModel> get listBook;
  @override
  List<AuthorModel> get listAuthor;
  @override
  List<dynamic> get listRecommendedByName;
  @override
  @JsonKey(ignore: true)
  _$$_HomeSearchStateCopyWith<_$_HomeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
