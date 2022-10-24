import 'package:project_tani/feature/login/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel?> signUp(String? name, String? phoneNumber, String? email, String? password);
  Future<AuthModel?> login(String? email, String? password);
}