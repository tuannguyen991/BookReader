// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'high_light_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HighLightNotificationModel _$HighLightNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _HighLightNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$HighLightNotificationModel {
  String get bookName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HighLightNotificationModelCopyWith<HighLightNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighLightNotificationModelCopyWith<$Res> {
  factory $HighLightNotificationModelCopyWith(HighLightNotificationModel value,
          $Res Function(HighLightNotificationModel) then) =
      _$HighLightNotificationModelCopyWithImpl<$Res,
          HighLightNotificationModel>;
  @useResult
  $Res call({String bookName, String content});
}

/// @nodoc
class _$HighLightNotificationModelCopyWithImpl<$Res,
        $Val extends HighLightNotificationModel>
    implements $HighLightNotificationModelCopyWith<$Res> {
  _$HighLightNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HighLightNotificationModelCopyWith<$Res>
    implements $HighLightNotificationModelCopyWith<$Res> {
  factory _$$_HighLightNotificationModelCopyWith(
          _$_HighLightNotificationModel value,
          $Res Function(_$_HighLightNotificationModel) then) =
      __$$_HighLightNotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bookName, String content});
}

/// @nodoc
class __$$_HighLightNotificationModelCopyWithImpl<$Res>
    extends _$HighLightNotificationModelCopyWithImpl<$Res,
        _$_HighLightNotificationModel>
    implements _$$_HighLightNotificationModelCopyWith<$Res> {
  __$$_HighLightNotificationModelCopyWithImpl(
      _$_HighLightNotificationModel _value,
      $Res Function(_$_HighLightNotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? content = null,
  }) {
    return _then(_$_HighLightNotificationModel(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HighLightNotificationModel extends _HighLightNotificationModel {
  const _$_HighLightNotificationModel({this.bookName = '', this.content = ''})
      : super._();

  factory _$_HighLightNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_HighLightNotificationModelFromJson(json);

  @override
  @JsonKey()
  final String bookName;
  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'HighLightNotificationModel(bookName: $bookName, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HighLightNotificationModel &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookName, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HighLightNotificationModelCopyWith<_$_HighLightNotificationModel>
      get copyWith => __$$_HighLightNotificationModelCopyWithImpl<
          _$_HighLightNotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HighLightNotificationModelToJson(
      this,
    );
  }
}

abstract class _HighLightNotificationModel extends HighLightNotificationModel {
  const factory _HighLightNotificationModel(
      {final String bookName,
      final String content}) = _$_HighLightNotificationModel;
  const _HighLightNotificationModel._() : super._();

  factory _HighLightNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_HighLightNotificationModel.fromJson;

  @override
  String get bookName;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_HighLightNotificationModelCopyWith<_$_HighLightNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}
