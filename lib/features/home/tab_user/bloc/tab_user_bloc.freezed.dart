// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabUserState {
  bool get isLoading => throw _privateConstructorUsedError; //
  UserModel get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabUserStateCopyWith<TabUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabUserStateCopyWith<$Res> {
  factory $TabUserStateCopyWith(
          TabUserState value, $Res Function(TabUserState) then) =
      _$TabUserStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$TabUserStateCopyWithImpl<$Res> implements $TabUserStateCopyWith<$Res> {
  _$TabUserStateCopyWithImpl(this._value, this._then);

  final TabUserState _value;
  // ignore: unused_field
  final $Res Function(TabUserState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
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
  $Res call({bool isLoading, UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_TabUserStateCopyWithImpl<$Res>
    extends _$TabUserStateCopyWithImpl<$Res>
    implements _$$_TabUserStateCopyWith<$Res> {
  __$$_TabUserStateCopyWithImpl(
      _$_TabUserState _value, $Res Function(_$_TabUserState) _then)
      : super(_value, (v) => _then(v as _$_TabUserState));

  @override
  _$_TabUserState get _value => super._value as _$_TabUserState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_TabUserState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_TabUserState implements _TabUserState {
  const _$_TabUserState(
      {this.isLoading = true,
      this.user = const UserModel(
          id: '',
          firstName: '',
          lastName: '',
          userName: '',
          password: '',
          email: '',
          phone: '',
          age: -1,
          gender: false,
          imageLink: '',
          imagaLinkRanking: '',
          readingTime: 0,
          readBooks: 0)});

  @override
  @JsonKey()
  final bool isLoading;
//
  @override
  @JsonKey()
  final UserModel user;

  @override
  String toString() {
    return 'TabUserState(isLoading: $isLoading, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabUserState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_TabUserStateCopyWith<_$_TabUserState> get copyWith =>
      __$$_TabUserStateCopyWithImpl<_$_TabUserState>(this, _$identity);
}

abstract class _TabUserState implements TabUserState {
  const factory _TabUserState({final bool isLoading, final UserModel user}) =
      _$_TabUserState;

  @override
  bool get isLoading;
  @override //
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$_TabUserStateCopyWith<_$_TabUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
