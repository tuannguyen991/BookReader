import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  // In order to appropriately override the toString method, we need to declare an named private constructor with the use of
  const AuthorModel._();

  const factory AuthorModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String shortBio,
    @Default('https://www.dropbox.com/s/rv4616h4p501p6k/default.jpg?raw=1')
        String imageLink,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, Object?> json) =>
      _$AuthorModelFromJson(json);

  @override
  String toString() {
    return name;
  }
}
