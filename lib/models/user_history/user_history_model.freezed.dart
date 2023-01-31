// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserHistoryModel _$UserHistoryModelFromJson(Map<String, dynamic> json) {
  return _UserHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$UserHistoryModel {
  DateTime? get date => throw _privateConstructorUsedError;
  double get readingTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserHistoryModelCopyWith<UserHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHistoryModelCopyWith<$Res> {
  factory $UserHistoryModelCopyWith(
          UserHistoryModel value, $Res Function(UserHistoryModel) then) =
      _$UserHistoryModelCopyWithImpl<$Res, UserHistoryModel>;
  @useResult
  $Res call({DateTime? date, double readingTime});
}

/// @nodoc
class _$UserHistoryModelCopyWithImpl<$Res, $Val extends UserHistoryModel>
    implements $UserHistoryModelCopyWith<$Res> {
  _$UserHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? readingTime = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readingTime: null == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserHistoryModelCopyWith<$Res>
    implements $UserHistoryModelCopyWith<$Res> {
  factory _$$_UserHistoryModelCopyWith(
          _$_UserHistoryModel value, $Res Function(_$_UserHistoryModel) then) =
      __$$_UserHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, double readingTime});
}

/// @nodoc
class __$$_UserHistoryModelCopyWithImpl<$Res>
    extends _$UserHistoryModelCopyWithImpl<$Res, _$_UserHistoryModel>
    implements _$$_UserHistoryModelCopyWith<$Res> {
  __$$_UserHistoryModelCopyWithImpl(
      _$_UserHistoryModel _value, $Res Function(_$_UserHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? readingTime = null,
  }) {
    return _then(_$_UserHistoryModel(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readingTime: null == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserHistoryModel implements _UserHistoryModel {
  const _$_UserHistoryModel({this.date, this.readingTime = 0});

  factory _$_UserHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserHistoryModelFromJson(json);

  @override
  final DateTime? date;
  @override
  @JsonKey()
  final double readingTime;

  @override
  String toString() {
    return 'UserHistoryModel(date: $date, readingTime: $readingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserHistoryModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.readingTime, readingTime) ||
                other.readingTime == readingTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, readingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserHistoryModelCopyWith<_$_UserHistoryModel> get copyWith =>
      __$$_UserHistoryModelCopyWithImpl<_$_UserHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserHistoryModelToJson(
      this,
    );
  }
}

abstract class _UserHistoryModel implements UserHistoryModel {
  const factory _UserHistoryModel(
      {final DateTime? date, final double readingTime}) = _$_UserHistoryModel;

  factory _UserHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_UserHistoryModel.fromJson;

  @override
  DateTime? get date;
  @override
  double get readingTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserHistoryModelCopyWith<_$_UserHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
