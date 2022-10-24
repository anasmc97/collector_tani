import 'package:project_tani/feature/login/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signUp(String? name, String? phoneNumber, String? email, String? password);
  Future<User?> login(String? email, String? password);
}