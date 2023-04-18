// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_infor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateInforState {
  UserModel get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateInforStateCopyWith<UpdateInforState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInforStateCopyWith<$Res> {
  factory $UpdateInforStateCopyWith(
          UpdateInforState value, $Res Function(UpdateInforState) then) =
      _$UpdateInforStateCopyWithImpl<$Res, UpdateInforState>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UpdateInforStateCopyWithImpl<$Res, $Val extends UpdateInforState>
    implements $UpdateInforStateCopyWith<$Res> {
  _$UpdateInforStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
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
abstract class _$$_UpdateInforStateCopyWith<$Res>
    implements $UpdateInforStateCopyWith<$Res> {
  factory _$$_UpdateInforStateCopyWith(
          _$_UpdateInforState value, $Res Function(_$_UpdateInforState) then) =
      __$$_UpdateInforStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UpdateInforStateCopyWithImpl<$Res>
    extends _$UpdateInforStateCopyWithImpl<$Res, _$_UpdateInforState>
    implements _$$_UpdateInforStateCopyWith<$Res> {
  __$$_UpdateInforStateCopyWithImpl(
      _$_UpdateInforState _value, $Res Function(_$_UpdateInforState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_UpdateInforState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_UpdateInforState implements _UpdateInforState {
  const _$_UpdateInforState({this.user = const UserModel()});

  @override
  @JsonKey()
  final UserModel user;

  @override
  String toString() {
    return 'UpdateInforState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInforState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInforStateCopyWith<_$_UpdateInforState> get copyWith =>
      __$$_UpdateInforStateCopyWithImpl<_$_UpdateInforState>(this, _$identity);
}

abstract class _UpdateInforState implements UpdateInforState {
  const factory _UpdateInforState({final UserModel user}) = _$_UpdateInforState;

  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInforStateCopyWith<_$_UpdateInforState> get copyWith =>
      throw _privateConstructorUsedError;
}
