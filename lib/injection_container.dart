import 'package:get_it/get_it.dart';
import 'package:project_tani/feature/Farmer/data/datasources/farmer_remote_datasource.dart';
import 'package:project_tani/feature/Farmer/data/repositories/farmer_repository_impl.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/add_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/delete_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/get_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/update_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/login/data/datasources/auth_remote_datasource.dart';
import 'package:project_tani/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';
import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/logout_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';

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

  sl.registerFactory(() => FarmerBloc(
      addFarmer: sl(),
      getAllFarmer: sl(),
      updateFarmer: sl(),
      deleteFarmer: sl()
  ));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => SignUpUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  sl.registerLazySingleton(() => AddFarmerUsecase(sl()));
  sl.registerLazySingleton(() => GetAllFarmerUsecase(sl()));
  sl.registerLazySingleton(() => UpdateFarmerUsecase(sl()));
  sl.registerLazySingleton(() => DeleteFarmerUsecase(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FarmerRepository>(
        () => FarmerRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );



  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<FarmerRemoteDataSource>(
        () => FarmerRemoteDataSourceImpl(),
  );
  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
}