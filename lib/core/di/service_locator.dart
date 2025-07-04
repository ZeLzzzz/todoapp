import 'package:get_it/get_it.dart';
import 'package:todoapp/core/network/dio_client.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => DioClient());
}
