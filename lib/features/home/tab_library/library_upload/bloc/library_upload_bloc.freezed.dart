// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'library_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LibraryUploadState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  BookModel get bookItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryUploadStateCopyWith<LibraryUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryUploadStateCopyWith<$Res> {
  factory $LibraryUploadStateCopyWith(
          LibraryUploadState value, $Res Function(LibraryUploadState) then) =
      _$LibraryUploadStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, List<CategoryModel> categories, BookModel bookItem});

  $BookModelCopyWith<$Res> get bookItem;
}

/// @nodoc
class _$LibraryUploadStateCopyWithImpl<$Res>
    implements $LibraryUploadStateCopyWith<$Res> {
  _$LibraryUploadStateCopyWithImpl(this._value, this._then);

  final LibraryUploadState _value;
  // ignore: unused_field
  final $Res Function(LibraryUploadState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categories = freezed,
    Object? bookItem = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
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
abstract class _$$_LibraryUploadStateCopyWith<$Res>
    implements $LibraryUploadStateCopyWith<$Res> {
  factory _$$_LibraryUploadStateCopyWith(_$_LibraryUploadState value,
          $Res Function(_$_LibraryUploadState) then) =
      __$$_LibraryUploadStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, List<CategoryModel> categories, BookModel bookItem});

  @override
  $BookModelCopyWith<$Res> get bookItem;
}

/// @nodoc
class __$$_LibraryUploadStateCopyWithImpl<$Res>
    extends _$LibraryUploadStateCopyWithImpl<$Res>
    implements _$$_LibraryUploadStateCopyWith<$Res> {
  __$$_LibraryUploadStateCopyWithImpl(
      _$_LibraryUploadState _value, $Res Function(_$_LibraryUploadState) _then)
      : super(_value, (v) => _then(v as _$_LibraryUploadState));

  @override
  _$_LibraryUploadState get _value => super._value as _$_LibraryUploadState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categories = freezed,
    Object? bookItem = freezed,
  }) {
    return _then(_$_LibraryUploadState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      bookItem: bookItem == freezed
          ? _value.bookItem
          : bookItem // ignore: cast_nullable_to_non_nullable
              as BookModel,
    ));
  }
}

/// @nodoc

class _$_LibraryUploadState implements _LibraryUploadState {
  const _$_LibraryUploadState(
      {this.isLoading = true,
      final List<CategoryModel> categories = const [],
      this.bookItem = const BookModel()})
      : _categories = categories;

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final BookModel bookItem;

  @override
  String toString() {
    return 'LibraryUploadState(isLoading: $isLoading, categories: $categories, bookItem: $bookItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LibraryUploadState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other.bookItem, bookItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(bookItem));

  @JsonKey(ignore: true)
  @override
  _$$_LibraryUploadStateCopyWith<_$_LibraryUploadState> get copyWith =>
      __$$_LibraryUploadStateCopyWithImpl<_$_LibraryUploadState>(
          this, _$identity);
}

abstract class _LibraryUploadState implements LibraryUploadState {
  const factory _LibraryUploadState(
      {final bool isLoading,
      final List<CategoryModel> categories,
      final BookModel bookItem}) = _$_LibraryUploadState;

  @override
  bool get isLoading;
  @override
  List<CategoryModel> get categories;
  @override
  BookModel get bookItem;
  @override
  @JsonKey(ignore: true)
  _$$_LibraryUploadStateCopyWith<_$_LibraryUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}
