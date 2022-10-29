import 'package:get_it/get_it.dart';
import 'package:project_tani/feature/login/data/datasources/auth_remote_datasource.dart';
import 'package:project_tani/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';
import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/logout_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Login
  // Bloc
  sl.registerFactory(
        () => AuthBloc(
      login: sl(),
      signUp: sl(),
      logout: sl()
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => SignUpUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(),
  );
  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
}