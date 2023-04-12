// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabUserState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  List<UserBookModel> get readBooks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabUserStateCopyWith<TabUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabUserStateCopyWith<$Res> {
  factory $TabUserStateCopyWith(
          TabUserState value, $Res Function(TabUserState) then) =
      _$TabUserStateCopyWithImpl<$Res, TabUserState>;
  @useResult
  $Res call({bool isLoading, UserModel user, List<UserBookModel> readBooks});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$TabUserStateCopyWithImpl<$Res, $Val extends TabUserState>
    implements $TabUserStateCopyWith<$Res> {
  _$TabUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = null,
    Object? readBooks = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      readBooks: null == readBooks
          ? _value.readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TabUserStateCopyWith<$Res>
    implements $TabUserStateCopyWith<$Res> {
  factory _$$_TabUserStateCopyWith(
          _$_TabUserState value, $Res Function(_$_TabUserState) then) =
      __$$_TabUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, UserModel user, List<UserBookModel> readBooks});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_TabUserStateCopyWithImpl<$Res>
    extends _$TabUserStateCopyWithImpl<$Res, _$_TabUserState>
    implements _$$_TabUserStateCopyWith<$Res> {
  __$$_TabUserStateCopyWithImpl(
      _$_TabUserState _value, $Res Function(_$_TabUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = null,
    Object? readBooks = null,
  }) {
    return _then(_$_TabUserState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      readBooks: null == readBooks
          ? _value._readBooks
          : readBooks // ignore: cast_nullable_to_non_nullable
              as List<UserBookModel>,
    ));
  }
}

/// @nodoc

class _$_TabUserState implements _TabUserState {
  const _$_TabUserState(
      {this.isLoading = true,
      this.user = const UserModel(),
      final List<UserBookModel> readBooks = const []})
      : _readBooks = readBooks;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserModel user;
  final List<UserBookModel> _readBooks;
  @override
  @JsonKey()
  List<UserBookModel> get readBooks {
    if (_readBooks is EqualUnmodifiableListView) return _readBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBooks);
  }

  @override
  String toString() {
    return 'TabUserState(isLoading: $isLoading, user: $user, readBooks: $readBooks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabUserState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._readBooks, _readBooks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, user,
      const DeepCollectionEquality().hash(_readBooks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabUserStateCopyWith<_$_TabUserState> get copyWith =>
      __$$_TabUserStateCopyWithImpl<_$_TabUserState>(this, _$identity);
}

abstract class _TabUserState implements TabUserState {
  const factory _TabUserState(
      {final bool isLoading,
      final UserModel user,
      final List<UserBookModel> readBooks}) = _$_TabUserState;

  @override
  bool get isLoading;
  @override
  UserModel get user;
  @override
  List<UserBookModel> get readBooks;
  @override
  @JsonKey(ignore: true)
  _$$_TabUserStateCopyWith<_$_TabUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
