import 'package:freezed_annotation/freezed_annotation.dart';
part 'high_light_notification_model.freezed.dart';
part 'high_light_notification_model.g.dart';

@freezed
class HighLightNotificationModel with _$HighLightNotificationModel {
  // In order to appropriately override the toString method, we need to declare an named private constructor with the use of
  const HighLightNotificationModel._();

  const factory HighLightNotificationModel({
    @Default('') String bookName,
    @Default('') String content,
  }) = _HighLightNotificationModel;

  factory HighLightNotificationModel.fromJson(Map<String, Object?> json) =>
      _$HighLightNotificationModelFromJson(json);
}
