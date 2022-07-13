// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authors_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthorsState {
  List<AuthorModel> get authors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorsStateCopyWith<AuthorsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) then) =
      _$AuthorsStateCopyWithImpl<$Res>;
  $Res call({List<AuthorModel> authors});
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res> implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._value, this._then);

  final AuthorsState _value;
  // ignore: unused_field
  final $Res Function(AuthorsState) _then;

  @override
  $Res call({
    Object? authors = freezed,
  }) {
    return _then(_value.copyWith(
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthorsStateCopyWith<$Res>
    implements $AuthorsStateCopyWith<$Res> {
  factory _$$_AuthorsStateCopyWith(
          _$_AuthorsState value, $Res Function(_$_AuthorsState) then) =
      __$$_AuthorsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<AuthorModel> authors});
}

/// @nodoc
class __$$_AuthorsStateCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res>
    implements _$$_AuthorsStateCopyWith<$Res> {
  __$$_AuthorsStateCopyWithImpl(
      _$_AuthorsState _value, $Res Function(_$_AuthorsState) _then)
      : super(_value, (v) => _then(v as _$_AuthorsState));

  @override
  _$_AuthorsState get _value => super._value as _$_AuthorsState;

  @override
  $Res call({
    Object? authors = freezed,
  }) {
    return _then(_$_AuthorsState(
      authors: authors == freezed
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
    ));
  }
}

/// @nodoc

class _$_AuthorsState implements _AuthorsState {
  const _$_AuthorsState({final List<AuthorModel> authors = const []})
      : _authors = authors;

  final List<AuthorModel> _authors;
  @override
  @JsonKey()
  List<AuthorModel> get authors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  String toString() {
    return 'AuthorsState(authors: $authors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorsState &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_authors));

  @JsonKey(ignore: true)
  @override
  _$$_AuthorsStateCopyWith<_$_AuthorsState> get copyWith =>
      __$$_AuthorsStateCopyWithImpl<_$_AuthorsState>(this, _$identity);
}

abstract class _AuthorsState implements AuthorsState {
  const factory _AuthorsState({final List<AuthorModel> authors}) =
      _$_AuthorsState;

  @override
  List<AuthorModel> get authors;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorsStateCopyWith<_$_AuthorsState> get copyWith =>
      throw _privateConstructorUsedError;
}
