import 'package:demo_book_reader/models/user_history/user_history_model.dart';
import 'package:demo_book_reader/models/user_reading_package/user_reading_package_model.dart';
import 'package:demo_book_reader/share/enum/ranking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    DateTime? birthDate,
    @Default('') String imageLink,
    @Default(0) int totalReadingTime,
    @Default(Ranking.bronze) Ranking ranking,
    UserReadingPackageModel? currentPackage,
    @Default([]) List<UserHistoryModel> recentlyHistories,
    @Default(0) int totalReadingBooks,
    @Default('') String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
