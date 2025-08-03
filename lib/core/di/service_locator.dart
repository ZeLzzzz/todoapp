import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todoapp/core/network/dio_client.dart';
import 'package:todoapp/data/repositories/auth_repository.dart';
import 'package:todoapp/features/auth/viewmodels/login_viewmodel.dart';
import 'package:todoapp/features/auth/viewmodels/register_viewmodel.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl<Dio>()));

  sl.registerFactory(() => RegisterViewmodel());
  sl.registerFactory(() => LoginViewmodel());
}
