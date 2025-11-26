import 'auth_service.dart';

class AuthLogic {
  final AuthService service;

  AuthLogic(this.service);

  Future<String> login(String email, String password) async {
    try {
      final token = await service.signIn(email, password);
      return token; // success
    } catch (e) {
      return 'ERROR'; // fail
    }
  }
}
