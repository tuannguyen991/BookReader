// Mocks generated by Mockito 5.4.0 from annotations
// in demo_book_reader/test/features/login/bloc/login_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:demo_book_reader/data/repository/user_repository.dart' as _i3;
import 'package:demo_book_reader/models/user/create_user/create_user_model.dart'
    as _i5;
import 'package:demo_book_reader/models/user/update_user/update_user_model.dart'
    as _i6;
import 'package:demo_book_reader/models/user/user_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> getInfor({required String? token}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInfor,
          [],
          {#token: token},
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #getInfor,
            [],
            {#token: token},
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<_i2.UserModel> getInforWithCurrentPackage(
          {required String? token}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInforWithCurrentPackage,
          [],
          {#token: token},
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #getInforWithCurrentPackage,
            [],
            {#token: token},
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<_i2.UserModel> registerReadingPackage({
    required String? token,
    required String? readingPackageId,
    required DateTime? startDate,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerReadingPackage,
          [],
          {
            #token: token,
            #readingPackageId: readingPackageId,
            #startDate: startDate,
          },
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #registerReadingPackage,
            [],
            {
              #token: token,
              #readingPackageId: readingPackageId,
              #startDate: startDate,
            },
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<void> createUser({required _i5.CreateUserModel? user}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [],
          {#user: user},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> updateUser({
    required String? token,
    required _i6.UpdateUserModel? user,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUser,
          [],
          {
            #token: token,
            #user: user,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> uploadImage({
    required String? userId,
    required String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadImage,
          [],
          {
            #userId: userId,
            #path: path,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
