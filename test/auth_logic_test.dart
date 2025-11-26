import 'package:flutter_test/flutter_test.dart';
import 'package:mp_lab14/auth_logic.dart';
import 'package:mp_lab14/auth_service.dart';

// Fake success service
class FakeAuthSuccess implements AuthService {
  @override
  Future<String> signIn(String email, String password) async {
    return 'token123';
  }
}

// Fake failure service
class FakeAuthFail implements AuthService {
  @override
  Future<String> signIn(String email, String password) async {
    throw Exception('Invalid credentials');
  }
}

void main() {
  test('login returns token on success', () async {
    final logic = AuthLogic(FakeAuthSuccess());

    final result = await logic.login('test@mail.com', '123456');

    expect(result, 'token123');
  });

  test('login returns ERROR on failure', () async {
    final logic = AuthLogic(FakeAuthFail());

    final result = await logic.login('test@mail.com', 'wrong');

    expect(result, 'ERROR');
  });
}
