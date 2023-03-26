// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadingPackageModel _$ReadingPackageModelFromJson(Map<String, dynamic> json) {
  return _ReadingPackageModel.fromJson(json);
}

/// @nodoc
mixin _$ReadingPackageModel {
  String get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // @Default(Duration()) Duration duration,
  int get price => throw _privateConstructorUsedError;
  int get currency => throw _privateConstructorUsedError;
  int get discountPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingPackageModelCopyWith<ReadingPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingPackageModelCopyWith<$Res> {
  factory $ReadingPackageModelCopyWith(
          ReadingPackageModel value, $Res Function(ReadingPackageModel) then) =
      _$ReadingPackageModelCopyWithImpl<$Res, ReadingPackageModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      int price,
      int currency,
      int discountPercentage});
}

/// @nodoc
class _$ReadingPackageModelCopyWithImpl<$Res, $Val extends ReadingPackageModel>
    implements $ReadingPackageModelCopyWith<$Res> {
  _$ReadingPackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? discountPercentage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadingPackageModelCopyWith<$Res>
    implements $ReadingPackageModelCopyWith<$Res> {
  factory _$$_ReadingPackageModelCopyWith(_$_ReadingPackageModel value,
          $Res Function(_$_ReadingPackageModel) then) =
      __$$_ReadingPackageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int price,
      int currency,
      int discountPercentage});
}

/// @nodoc
class __$$_ReadingPackageModelCopyWithImpl<$Res>
    extends _$ReadingPackageModelCopyWithImpl<$Res, _$_ReadingPackageModel>
    implements _$$_ReadingPackageModelCopyWith<$Res> {
  __$$_ReadingPackageModelCopyWithImpl(_$_ReadingPackageModel _value,
      $Res Function(_$_ReadingPackageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? discountPercentage = null,
  }) {
    return _then(_$_ReadingPackageModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadingPackageModel implements _ReadingPackageModel {
  const _$_ReadingPackageModel(
      {this.id = '',
      this.name = '',
      this.price = 0,
      this.currency = 1,
      this.discountPercentage = 0});

  factory _$_ReadingPackageModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReadingPackageModelFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
// @Default(Duration()) Duration duration,
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int currency;
  @override
  @JsonKey()
  final int discountPercentage;

  @override
  String toString() {
    return 'ReadingPackageModel(id: $id, name: $name, price: $price, currency: $currency, discountPercentage: $discountPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadingPackageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, currency, discountPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadingPackageModelCopyWith<_$_ReadingPackageModel> get copyWith =>
      __$$_ReadingPackageModelCopyWithImpl<_$_ReadingPackageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadingPackageModelToJson(
      this,
    );
  }
}

abstract class _ReadingPackageModel implements ReadingPackageModel {
  const factory _ReadingPackageModel(
      {final String id,
      final String name,
      final int price,
      final int currency,
      final int discountPercentage}) = _$_ReadingPackageModel;

  factory _ReadingPackageModel.fromJson(Map<String, dynamic> json) =
      _$_ReadingPackageModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override // @Default(Duration()) Duration duration,
  int get price;
  @override
  int get currency;
  @override
  int get discountPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_ReadingPackageModelCopyWith<_$_ReadingPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
