// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryDetailState {
  List<UserBookModel> get books => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDetailStateCopyWith<CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailStateCopyWith<$Res> {
  factory $CategoryDetailStateCopyWith(
          CategoryDetailState value, $Res Function(CategoryDetailState) then) =
      _$CategoryDetailStateCopyWithImpl<$Res, CategoryDetailState>;
  @useResult
  $Res call({List<UserBookModel> books});
}

/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res, $Val extends CategoryDetailState>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDetailStateCopyWith<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  factory _$$_CategoryDetailStateCopyWith(_$_CategoryDetailState value,
          $Res Function(_$_CategoryDetailState) then) =
      __$$_CategoryDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserBookModel> books});
}

/// @nodoc
class __$$_CategoryDetailStateCopyWithImpl<$Res>
    extends _$CategoryDetailStateCopyWithImpl<$Res, _$_CategoryDetailState>
    implements _$$_CategoryDetailStateCopyWith<$Res> {
  __$$_CategoryDetailStateCopyWithImpl(_$_CategoryDetailState _value,
      $Res Function(_$_CategoryDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$_CategoryDetailState(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
    ));
  }
}

/// @nodoc

class _$_CategoryDetailState implements _CategoryDetailState {
  const _$_CategoryDetailState({final List<UserBookModel> books = const []})
      : _books = books;

  final List<UserBookModel> _books;
  @override
  @JsonKey()
  List<UserBookModel> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'CategoryDetailState(books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDetailState &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDetailStateCopyWith<_$_CategoryDetailState> get copyWith =>
      __$$_CategoryDetailStateCopyWithImpl<_$_CategoryDetailState>(
          this, _$identity);
}

abstract class _CategoryDetailState implements CategoryDetailState {
  const factory _CategoryDetailState({final List<UserBookModel> books}) =
      _$_CategoryDetailState;

  @override
  List<UserBookModel> get books;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDetailStateCopyWith<_$_CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
