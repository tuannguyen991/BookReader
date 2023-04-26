import 'package:bloc_test/bloc_test.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/features/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  group('LoginBloc', () {
    final userRepository = MockUserRepository();
    setUp(() async {
      SharedPreferences.setMockInitialValues({'phone': '0123'});
    });

    test('initial state should be LoginState', () {
      expect(
          LoginBloc(userRepository: userRepository).state, isA<LoginState>());
    });

    blocTest<LoginBloc, LoginState>(
      'should emit [] when nothing is added',
      build: () => LoginBloc(userRepository: userRepository),
      expect: () => [],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [] when nothing is added',
      build: () => LoginBloc(userRepository: userRepository),
      act: (bloc) => bloc.add(LoginLoaded()),
      expect: () => [const LoginState(phone: '0123')],
    );
  });
}
