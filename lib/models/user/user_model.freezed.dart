// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String get imageLink => throw _privateConstructorUsedError;
  int get totalReadingTime => throw _privateConstructorUsedError;
  Ranking get ranking => throw _privateConstructorUsedError;
  UserReadingPackageModel? get currentPackage =>
      throw _privateConstructorUsedError;
  List<UserHistoryModel> get recentlyHistories =>
      throw _privateConstructorUsedError;
  int get totalReadingBooks => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      DateTime? birthDate,
      String imageLink,
      int totalReadingTime,
      Ranking ranking,
      UserReadingPackageModel? currentPackage,
      List<UserHistoryModel> recentlyHistories,
      int totalReadingBooks,
      String id});

  $UserReadingPackageModelCopyWith<$Res>? get currentPackage;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? birthDate = freezed,
    Object? imageLink = null,
    Object? totalReadingTime = null,
    Object? ranking = null,
    Object? currentPackage = freezed,
    Object? recentlyHistories = null,
    Object? totalReadingBooks = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      totalReadingTime: null == totalReadingTime
          ? _value.totalReadingTime
          : totalReadingTime // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as Ranking,
      currentPackage: freezed == currentPackage
          ? _value.currentPackage
          : currentPackage // ignore: cast_nullable_to_non_nullable
              as UserReadingPackageModel?,
      recentlyHistories: null == recentlyHistories
          ? _value.recentlyHistories
          : recentlyHistories // ignore: cast_nullable_to_non_nullable
              as List<UserHistoryModel>,
      totalReadingBooks: null == totalReadingBooks
          ? _value.totalReadingBooks
          : totalReadingBooks // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserReadingPackageModelCopyWith<$Res>? get currentPackage {
    if (_value.currentPackage == null) {
      return null;
    }

    return $UserReadingPackageModelCopyWith<$Res>(_value.currentPackage!,
        (value) {
      return _then(_value.copyWith(currentPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      DateTime? birthDate,
      String imageLink,
      int totalReadingTime,
      Ranking ranking,
      UserReadingPackageModel? currentPackage,
      List<UserHistoryModel> recentlyHistories,
      int totalReadingBooks,
      String id});

  @override
  $UserReadingPackageModelCopyWith<$Res>? get currentPackage;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? birthDate = freezed,
    Object? imageLink = null,
    Object? totalReadingTime = null,
    Object? ranking = null,
    Object? currentPackage = freezed,
    Object? recentlyHistories = null,
    Object? totalReadingBooks = null,
    Object? id = null,
  }) {
    return _then(_$_UserModel(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      totalReadingTime: null == totalReadingTime
          ? _value.totalReadingTime
          : totalReadingTime // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as Ranking,
      currentPackage: freezed == currentPackage
          ? _value.currentPackage
          : currentPackage // ignore: cast_nullable_to_non_nullable
              as UserReadingPackageModel?,
      recentlyHistories: null == recentlyHistories
          ? _value._recentlyHistories
          : recentlyHistories // ignore: cast_nullable_to_non_nullable
              as List<UserHistoryModel>,
      totalReadingBooks: null == totalReadingBooks
          ? _value.totalReadingBooks
          : totalReadingBooks // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.birthDate,
      this.imageLink = '',
      this.totalReadingTime = 0,
      this.ranking = Ranking.bronze,
      this.currentPackage,
      final List<UserHistoryModel> recentlyHistories = const [],
      this.totalReadingBooks = 0,
      this.id = ''})
      : _recentlyHistories = recentlyHistories;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String email;
  @override
  final DateTime? birthDate;
  @override
  @JsonKey()
  final String imageLink;
  @override
  @JsonKey()
  final int totalReadingTime;
  @override
  @JsonKey()
  final Ranking ranking;
  @override
  final UserReadingPackageModel? currentPackage;
  final List<UserHistoryModel> _recentlyHistories;
  @override
  @JsonKey()
  List<UserHistoryModel> get recentlyHistories {
    if (_recentlyHistories is EqualUnmodifiableListView)
      return _recentlyHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentlyHistories);
  }

  @override
  @JsonKey()
  final int totalReadingBooks;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, birthDate: $birthDate, imageLink: $imageLink, totalReadingTime: $totalReadingTime, ranking: $ranking, currentPackage: $currentPackage, recentlyHistories: $recentlyHistories, totalReadingBooks: $totalReadingBooks, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.totalReadingTime, totalReadingTime) ||
                other.totalReadingTime == totalReadingTime) &&
            (identical(other.ranking, ranking) || other.ranking == ranking) &&
            (identical(other.currentPackage, currentPackage) ||
                other.currentPackage == currentPackage) &&
            const DeepCollectionEquality()
                .equals(other._recentlyHistories, _recentlyHistories) &&
            (identical(other.totalReadingBooks, totalReadingBooks) ||
                other.totalReadingBooks == totalReadingBooks) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      birthDate,
      imageLink,
      totalReadingTime,
      ranking,
      currentPackage,
      const DeepCollectionEquality().hash(_recentlyHistories),
      totalReadingBooks,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String firstName,
      final String lastName,
      final String email,
      final DateTime? birthDate,
      final String imageLink,
      final int totalReadingTime,
      final Ranking ranking,
      final UserReadingPackageModel? currentPackage,
      final List<UserHistoryModel> recentlyHistories,
      final int totalReadingBooks,
      final String id}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  DateTime? get birthDate;
  @override
  String get imageLink;
  @override
  int get totalReadingTime;
  @override
  Ranking get ranking;
  @override
  UserReadingPackageModel? get currentPackage;
  @override
  List<UserHistoryModel> get recentlyHistories;
  @override
  int get totalReadingBooks;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
