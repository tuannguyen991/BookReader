import 'package:freezed_annotation/freezed_annotation.dart';
part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required String id,
    required String name,
    required String gender,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, Object?> json) =>
      _$AuthorModelFromJson(json);
}
