import 'package:get_it/get_it.dart';
import 'package:project_tani/feature/Farmer/data/datasources/farmer_remote_datasource.dart';
import 'package:project_tani/feature/Farmer/data/repositories/farmer_repository_impl.dart';
import 'package:project_tani/feature/Farmer/domain/repositories/farmer_repositories.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/add_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/delete_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/get_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/domain/usecase/update_farmer_usecase.dart';
import 'package:project_tani/feature/Farmer/presentation/farmer_bloc/farmer_bloc.dart';
import 'package:project_tani/feature/comodity/data/datasources/comodity_remote_datasource.dart';
import 'package:project_tani/feature/comodity/data/repositories/comodity_repository_impl.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/repositories/comodity_repositories.dart';
import 'package:project_tani/feature/comodity/domain/usecase/add_comodity_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/delete_comodity_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_fruits_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_list_comodity.dart';
import 'package:project_tani/feature/comodity/domain/usecase/get_list_comodity_verified_usecase.dart';
import 'package:project_tani/feature/comodity/domain/usecase/update_comodity.dart';
import 'package:project_tani/feature/comodity/domain/usecase/verify_comodity.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/login/data/datasources/auth_remote_datasource.dart';
import 'package:project_tani/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:project_tani/feature/login/domain/repositories/auth_repositories.dart';
import 'package:project_tani/feature/login/domain/usecase/login_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/logout_usecase.dart';
import 'package:project_tani/feature/login/domain/usecase/sign_up_usecase.dart';
import 'package:project_tani/feature/login/presentation/bloc/auth_bloc.dart';
import 'package:project_tani/feature/transaction/data/datasources/customer_transaction_datasource.dart';
import 'package:project_tani/feature/transaction/data/datasources/farmer_transaction_datasource.dart';
import 'package:project_tani/feature/transaction/data/repositories/customer_transaction_repository_impl.dart';
import 'package:project_tani/feature/transaction/data/repositories/farmer_transaction_repository_impl.dart';
import 'package:project_tani/feature/transaction/domain/repositories/customer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/repositories/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/add_transaction_customer_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/get_list_customer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/customer_transaction_usecase/get_transaction_customer_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/add_farmer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/get_list_farmer_transaction_usecase.dart';
import 'package:project_tani/feature/transaction/domain/usecase/farmer_transaction_usecase/get_transaction_farmer_usecase.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/customer_transaction_bloc/customer_transaction_bloc.dart';
import 'package:project_tani/feature/transaction/presentation/bloc/farmer_transaction_bloc/farmer_transaction_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Login
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      login: sl(),
      signUp: sl(),
      logout: sl(),
    ),
  );

  sl.registerFactory(
    () => FarmerBloc(
      addFarmer: sl(),
      getAllFarmer: sl(),
      updateFarmer: sl(),
      deleteFarmer: sl(),
    ),
  );

  sl.registerFactory(
    () => ComodityBloc(
        addComodity: sl(),
        getFruits: sl(),
        getListComodity: sl(),
        getListComodityVerified: sl(),
        updateComodity: sl(),
        verifyComodity: sl(),
        deleteComodity: sl()),
  );

  sl.registerFactory(
    () => FarmerTransactionBloc(
      addFarmerTransaction: sl(),
      getListFarmerTransaction: sl(),
      getFarmerTransaction: sl(),
    ),
  );

  sl.registerFactory(
    () => CustomerTransactionBloc(
      addCustomerTransaction: sl(),
      getListCustomerTransaction: sl(),
      getCustomerTransaction: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => SignUpUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  sl.registerLazySingleton(() => AddFarmerUsecase(sl()));
  sl.registerLazySingleton(() => GetAllFarmerUsecase(sl()));
  sl.registerLazySingleton(() => UpdateFarmerUsecase(sl()));
  sl.registerLazySingleton(() => DeleteFarmerUsecase(sl()));

  sl.registerLazySingleton(() => AddComodityUsecase(sl()));
  sl.registerLazySingleton(() => GetFruitUsecase(sl()));
  sl.registerLazySingleton(() => GetListComodityUsecase(sl()));
  sl.registerLazySingleton(() => GetListComodityVerifiedUsecase(sl()));
  sl.registerLazySingleton(() => UpdateComodityUsecase(sl()));
  sl.registerLazySingleton(() => VerifyComodityUsecase(sl()));
  sl.registerLazySingleton(() => DeleteComodityUsecase(sl()));

  sl.registerLazySingleton(() => AddFarmerTransactionUsecase(sl()));
  sl.registerLazySingleton(() => GetListFarmerTransactionUsecase(sl()));
  sl.registerLazySingleton(() => GetFarmerTransactionUsecase(sl()));

  sl.registerLazySingleton(() => AddCustomerTransactionUsecase(sl()));
  sl.registerLazySingleton(() => GetListCustomerTransactionUsecase(sl()));
  sl.registerLazySingleton(() => GetCustomerTransactionUsecase(sl()));
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

  sl.registerLazySingleton<ComodityRepository>(
    () => ComodityRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FarmerTransactionRepository>(
    () => FarmerTransactionRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<CustomerTransactionRepository>(
    () => CustomerTransactionRepositoryImpl(
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

  sl.registerLazySingleton<ComodityRemoteDataSource>(
    () => ComodityRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<FarmerTransactionRemoteDataSource>(
    () => FarmerTransactionRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<CustomerTransactionRemoteDataSource>(
    () => CustomerTransactionRemoteDataSourceImpl(),
  );

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
}
