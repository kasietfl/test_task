import 'package:test_task/config/api_url.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/network/network_service.dart';

class UserRepository {
  final NetworkService _networkService;

  UserRepository({required NetworkService networkService})
      : _networkService = networkService;

  Future<UserModel> getAll() async {
    final response = await _networkService.get(ApiUrl.getUsers);
    return UserModel.fromJson(response.data);
  }

  // Future<UserModel> getUser() async {
  //   final response = await _networkService.get(ApiUrl.getUsers);
  //   return UserModel.fromJson(response.data);
  // }

  // Future<UserModel> createUser() async {
  //   final response = await _networkService.get(ApiUrl.getUsers);
  //   return UserModel.fromJson(response.data);
  // }

  // Future<UserModel> deleteUser() async {
  //   final response = await _networkService.get(ApiUrl.getUsers);
  //   return UserModel.fromJson(response.data);
  // }
}
