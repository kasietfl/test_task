import 'package:flutter/foundation.dart';
import 'package:test_task/app/locator.dart';
import 'package:test_task/data/models/user_detail_model.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserModel _users = UserModel();
  UserDetailModel _user = UserDetailModel();

  UserModel get users => _users;
  UserDetailModel get user => _user;

  Future<void> getAllUsers() async {
    final response = await locator<UserRepository>().getAll();
    _users = response;
    notifyListeners();
  }

  Future<void> getUserDetail({required int id}) async {
    final response = await locator<UserRepository>().getUser(id: id);
    _user = response;
    notifyListeners();
  }

  Future<void> createNewUser({required User user}) async {
    final response = await locator<UserRepository>().createUser(user: user);
    _users.data?.add(response);
    notifyListeners();
  }

  Future<void> deleteUserId({required int id}) async {
    // bool success = await locator<UserRepository>().deleteUser(id: id);
    _users.data?.removeAt(id);
    notifyListeners();
  }
}
