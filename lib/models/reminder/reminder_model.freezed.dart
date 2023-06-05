// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  String get id => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  @TimestampConverter()
  TimeOfDay get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderModelCopyWith<ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
          ReminderModel value, $Res Function(ReminderModel) then) =
      _$ReminderModelCopyWithImpl<$Res, ReminderModel>;
  @useResult
  $Res call({String id, bool isDefault, @TimestampConverter() TimeOfDay time});
}

/// @nodoc
class _$ReminderModelCopyWithImpl<$Res, $Val extends ReminderModel>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDefault = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReminderModelCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$$_ReminderModelCopyWith(
          _$_ReminderModel value, $Res Function(_$_ReminderModel) then) =
      __$$_ReminderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool isDefault, @TimestampConverter() TimeOfDay time});
}

/// @nodoc
class __$$_ReminderModelCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res, _$_ReminderModel>
    implements _$$_ReminderModelCopyWith<$Res> {
  __$$_ReminderModelCopyWithImpl(
      _$_ReminderModel _value, $Res Function(_$_ReminderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDefault = null,
    Object? time = null,
  }) {
    return _then(_$_ReminderModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReminderModel extends _ReminderModel {
  const _$_ReminderModel(
      {this.id = '',
      this.isDefault = false,
      @TimestampConverter() this.time = const TimeOfDay(hour: 0, minute: 0)})
      : super._();

  factory _$_ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReminderModelFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  @TimestampConverter()
  final TimeOfDay time;

  @override
  String toString() {
    return 'ReminderModel(id: $id, isDefault: $isDefault, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReminderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isDefault, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReminderModelCopyWith<_$_ReminderModel> get copyWith =>
      __$$_ReminderModelCopyWithImpl<_$_ReminderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReminderModelToJson(
      this,
    );
  }
}

abstract class _ReminderModel extends ReminderModel {
  const factory _ReminderModel(
      {final String id,
      final bool isDefault,
      @TimestampConverter() final TimeOfDay time}) = _$_ReminderModel;
  const _ReminderModel._() : super._();

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$_ReminderModel.fromJson;

  @override
  String get id;
  @override
  bool get isDefault;
  @override
  @TimestampConverter()
  TimeOfDay get time;
  @override
  @JsonKey(ignore: true)
  _$$_ReminderModelCopyWith<_$_ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
