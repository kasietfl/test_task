import 'package:test_task/config/api_url.dart';
import 'package:test_task/data/models/user_detail_model.dart';
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

  Future<UserDetailModel> getUser({required int id}) async {
    final response = await _networkService.get(ApiUrl.getUser(id));
    return UserDetailModel.fromJson(response.data);
  }

  Future<User> createUser({required User user}) async {
    final response = await _networkService.post(ApiUrl.getUsers, data: user);
    return User.fromJson(response.data);
  }

  Future<bool> deleteUser({required int id}) async {
    final response = await _networkService.delete(ApiUrl.getUser(id));
    return response.statusCode == 204;
  }
}
