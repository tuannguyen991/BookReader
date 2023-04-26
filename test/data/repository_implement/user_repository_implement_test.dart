import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository_implement/user_repository_implement.dart';
import 'package:demo_book_reader/mocking/user_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_implement_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getInfor', () {
    final client = MockClient();
    final userRepositoryImplement = UserRepositoryImplement(client);
    const token = '123';
    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathUsers}/$token',
    );
    final headers = {'Content-Type': 'application/json'};

    test('should get user information successfully', () async {
      when(client.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response(mockUser, 200));
      expect(await userRepositoryImplement.getInfor(token: token),
          UserModel.fromJson(json.decode(mockUser)));
    });

    test('should return empty UserModel when not found', () async {
      when(client.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(await userRepositoryImplement.getInfor(token: token),
          isA<UserModel>());
    });

    test('should throw an exception if the http call completes with an error',
        () {
      when(client.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('', 500));

      expect(userRepositoryImplement.getInfor(token: token), throwsException);
    });
  });
}
