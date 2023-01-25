import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/config/api_url.dart';
import 'package:test_task/data/network/network_service.dart';
import 'package:test_task/data/repository/user_repository.dart';

final locator = GetIt.instance;

void setup() {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
  final NetworkService networkService = NetworkService(dio: dio);

  locator.registerLazySingleton<NetworkService>(() => networkService);
  locator.registerLazySingleton<UserRepository>(
      () => UserRepository(networkService: locator()));
}
