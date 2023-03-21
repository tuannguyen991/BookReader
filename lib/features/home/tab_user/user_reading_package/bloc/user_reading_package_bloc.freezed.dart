// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reading_package_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserReadingPackageState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserReadingPackageModel get userReadingPackage =>
      throw _privateConstructorUsedError;
  List<ReadingPackageModel> get readingPackageList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserReadingPackageStateCopyWith<UserReadingPackageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReadingPackageStateCopyWith<$Res> {
  factory $UserReadingPackageStateCopyWith(UserReadingPackageState value,
          $Res Function(UserReadingPackageState) then) =
      _$UserReadingPackageStateCopyWithImpl<$Res, UserReadingPackageState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserReadingPackageModel userReadingPackage,
      List<ReadingPackageModel> readingPackageList});

  $UserReadingPackageModelCopyWith<$Res> get userReadingPackage;
}

/// @nodoc
class _$UserReadingPackageStateCopyWithImpl<$Res,
        $Val extends UserReadingPackageState>
    implements $UserReadingPackageStateCopyWith<$Res> {
  _$UserReadingPackageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userReadingPackage = null,
    Object? readingPackageList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userReadingPackage: null == userReadingPackage
          ? _value.userReadingPackage
          : userReadingPackage // ignore: cast_nullable_to_non_nullable
              as UserReadingPackageModel,
      readingPackageList: null == readingPackageList
          ? _value.readingPackageList
          : readingPackageList // ignore: cast_nullable_to_non_nullable
              as List<ReadingPackageModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserReadingPackageModelCopyWith<$Res> get userReadingPackage {
    return $UserReadingPackageModelCopyWith<$Res>(_value.userReadingPackage,
        (value) {
      return _then(_value.copyWith(userReadingPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserReadingPackageStateCopyWith<$Res>
    implements $UserReadingPackageStateCopyWith<$Res> {
  factory _$$_UserReadingPackageStateCopyWith(_$_UserReadingPackageState value,
          $Res Function(_$_UserReadingPackageState) then) =
      __$$_UserReadingPackageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserReadingPackageModel userReadingPackage,
      List<ReadingPackageModel> readingPackageList});

  @override
  $UserReadingPackageModelCopyWith<$Res> get userReadingPackage;
}

/// @nodoc
class __$$_UserReadingPackageStateCopyWithImpl<$Res>
    extends _$UserReadingPackageStateCopyWithImpl<$Res,
        _$_UserReadingPackageState>
    implements _$$_UserReadingPackageStateCopyWith<$Res> {
  __$$_UserReadingPackageStateCopyWithImpl(_$_UserReadingPackageState _value,
      $Res Function(_$_UserReadingPackageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userReadingPackage = null,
    Object? readingPackageList = null,
  }) {
    return _then(_$_UserReadingPackageState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userReadingPackage: null == userReadingPackage
          ? _value.userReadingPackage
          : userReadingPackage // ignore: cast_nullable_to_non_nullable
              as UserReadingPackageModel,
      readingPackageList: null == readingPackageList
          ? _value._readingPackageList
          : readingPackageList // ignore: cast_nullable_to_non_nullable
              as List<ReadingPackageModel>,
    ));
  }
}

/// @nodoc

class _$_UserReadingPackageState implements _UserReadingPackageState {
  const _$_UserReadingPackageState(
      {this.isLoading = true,
      this.userReadingPackage = const UserReadingPackageModel(),
      final List<ReadingPackageModel> readingPackageList = const [
        ReadingPackageModel()
      ]})
      : _readingPackageList = readingPackageList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserReadingPackageModel userReadingPackage;
  final List<ReadingPackageModel> _readingPackageList;
  @override
  @JsonKey()
  List<ReadingPackageModel> get readingPackageList {
    if (_readingPackageList is EqualUnmodifiableListView)
      return _readingPackageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readingPackageList);
  }

  @override
  String toString() {
    return 'UserReadingPackageState(isLoading: $isLoading, userReadingPackage: $userReadingPackage, readingPackageList: $readingPackageList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserReadingPackageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userReadingPackage, userReadingPackage) ||
                other.userReadingPackage == userReadingPackage) &&
            const DeepCollectionEquality()
                .equals(other._readingPackageList, _readingPackageList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userReadingPackage,
      const DeepCollectionEquality().hash(_readingPackageList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserReadingPackageStateCopyWith<_$_UserReadingPackageState>
      get copyWith =>
          __$$_UserReadingPackageStateCopyWithImpl<_$_UserReadingPackageState>(
              this, _$identity);
}

abstract class _UserReadingPackageState implements UserReadingPackageState {
  const factory _UserReadingPackageState(
          {final bool isLoading,
          final UserReadingPackageModel userReadingPackage,
          final List<ReadingPackageModel> readingPackageList}) =
      _$_UserReadingPackageState;

  @override
  bool get isLoading;
  @override
  UserReadingPackageModel get userReadingPackage;
  @override
  List<ReadingPackageModel> get readingPackageList;
  @override
  @JsonKey(ignore: true)
  _$$_UserReadingPackageStateCopyWith<_$_UserReadingPackageState>
      get copyWith => throw _privateConstructorUsedError;
}
