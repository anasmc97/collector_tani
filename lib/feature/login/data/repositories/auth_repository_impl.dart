import 'package:project_tani/feature/login/data/datasources/auth_remote_datasource.dart';
import 'package:project_tani/feature/login/domain/entities/user.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> login(String? email, String? password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<User?> signUp(String? name, String? phoneNumber, String? email, String? password) {
    return remoteDataSource.signUp(name, phoneNumber, email, password);
  }
}