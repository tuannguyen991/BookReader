import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_history_model.freezed.dart';
part 'user_history_model.g.dart';

@freezed
class UserHistoryModel with _$UserHistoryModel {
  const factory UserHistoryModel({
    DateTime? date,
    @Default(0) double readingTime,
  }) = _UserHistoryModel;

  factory UserHistoryModel.fromJson(Map<String, Object?> json) =>
      _$UserHistoryModelFromJson(json);
}
