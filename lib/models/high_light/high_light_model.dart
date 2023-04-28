import 'package:freezed_annotation/freezed_annotation.dart';
part 'high_light_model.freezed.dart';
part 'high_light_model.g.dart';

@freezed
class HighLightModel with _$HighLightModel {
  // In order to appropriately override the toString method, we need to declare an named private constructor with the use of
  const HighLightModel._();

  const factory HighLightModel({
    @Default('') String bookId,
    @Default('') String content,
    @Default('') String date,
    String? note,
    @Default('') String pageId,
    @Default(0) int pageNumber,
    @Default('') String rangy,
    @Default('') String type,
    @Default('') String uuid,
  }) = _HighLightModel;

  factory HighLightModel.fromJson(Map<String, Object?> json) =>
      _$HighLightModelFromJson(json);
}
