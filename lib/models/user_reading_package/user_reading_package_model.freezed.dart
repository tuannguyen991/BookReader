// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reading_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReadingPackageModel _$UserReadingPackageModelFromJson(
    Map<String, dynamic> json) {
  return _UserReadingPackageModel.fromJson(json);
}

/// @nodoc
mixin _$UserReadingPackageModel {
  ReadingPackageModel get readingPackage => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReadingPackageModelCopyWith<UserReadingPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReadingPackageModelCopyWith<$Res> {
  factory $UserReadingPackageModelCopyWith(UserReadingPackageModel value,
          $Res Function(UserReadingPackageModel) then) =
      _$UserReadingPackageModelCopyWithImpl<$Res, UserReadingPackageModel>;
  @useResult
  $Res call({ReadingPackageModel readingPackage, DateTime? startDate});

  $ReadingPackageModelCopyWith<$Res> get readingPackage;
}

/// @nodoc
class _$UserReadingPackageModelCopyWithImpl<$Res,
        $Val extends UserReadingPackageModel>
    implements $UserReadingPackageModelCopyWith<$Res> {
  _$UserReadingPackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? readingPackage = null,
    Object? startDate = freezed,
  }) {
    return _then(_value.copyWith(
      readingPackage: null == readingPackage
          ? _value.readingPackage
          : readingPackage // ignore: cast_nullable_to_non_nullable
              as ReadingPackageModel,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReadingPackageModelCopyWith<$Res> get readingPackage {
    return $ReadingPackageModelCopyWith<$Res>(_value.readingPackage, (value) {
      return _then(_value.copyWith(readingPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserReadingPackageModelCopyWith<$Res>
    implements $UserReadingPackageModelCopyWith<$Res> {
  factory _$$_UserReadingPackageModelCopyWith(_$_UserReadingPackageModel value,
          $Res Function(_$_UserReadingPackageModel) then) =
      __$$_UserReadingPackageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReadingPackageModel readingPackage, DateTime? startDate});

  @override
  $ReadingPackageModelCopyWith<$Res> get readingPackage;
}

/// @nodoc
class __$$_UserReadingPackageModelCopyWithImpl<$Res>
    extends _$UserReadingPackageModelCopyWithImpl<$Res,
        _$_UserReadingPackageModel>
    implements _$$_UserReadingPackageModelCopyWith<$Res> {
  __$$_UserReadingPackageModelCopyWithImpl(_$_UserReadingPackageModel _value,
      $Res Function(_$_UserReadingPackageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? readingPackage = null,
    Object? startDate = freezed,
  }) {
    return _then(_$_UserReadingPackageModel(
      readingPackage: null == readingPackage
          ? _value.readingPackage
          : readingPackage // ignore: cast_nullable_to_non_nullable
              as ReadingPackageModel,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserReadingPackageModel implements _UserReadingPackageModel {
  const _$_UserReadingPackageModel(
      {this.readingPackage = const ReadingPackageModel(), this.startDate});

  factory _$_UserReadingPackageModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserReadingPackageModelFromJson(json);

  @override
  @JsonKey()
  final ReadingPackageModel readingPackage;
  @override
  final DateTime? startDate;

  @override
  String toString() {
    return 'UserReadingPackageModel(readingPackage: $readingPackage, startDate: $startDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserReadingPackageModel &&
            (identical(other.readingPackage, readingPackage) ||
                other.readingPackage == readingPackage) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, readingPackage, startDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserReadingPackageModelCopyWith<_$_UserReadingPackageModel>
      get copyWith =>
          __$$_UserReadingPackageModelCopyWithImpl<_$_UserReadingPackageModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReadingPackageModelToJson(
      this,
    );
  }
}

abstract class _UserReadingPackageModel implements UserReadingPackageModel {
  const factory _UserReadingPackageModel(
      {final ReadingPackageModel readingPackage,
      final DateTime? startDate}) = _$_UserReadingPackageModel;

  factory _UserReadingPackageModel.fromJson(Map<String, dynamic> json) =
      _$_UserReadingPackageModel.fromJson;

  @override
  ReadingPackageModel get readingPackage;
  @override
  DateTime? get startDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserReadingPackageModelCopyWith<_$_UserReadingPackageModel>
      get copyWith => throw _privateConstructorUsedError;
}
