import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String userName,
    required String password,
    required String email,
    required String phone,
    required int age,
    required bool gender,
    required String imageLink,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

// class UserModel {
//   UserModel({required this.name, required this.email, required this.avatarUrl});
//   final String name;
//   final String email;
//   final String avatarUrl;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//         name: json['name'], email: json['email'], avatarUrl: json['avatarUrl']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['name'] = name;
//     data['email'] = email;
//     data['avatarUrl'] = avatarUrl;
//
//     return data;
//   }
//
//   UserModel copyWith({String? name, String? email, String? avatarUrl}) {
//     return UserModel(
//         name: name ?? this.name,
//         email: email ?? this.email,
//         avatarUrl: avatarUrl ?? this.avatarUrl);
//   }
// }
//
