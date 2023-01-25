import 'package:flutter/foundation.dart';
import 'package:test_task/app/locator.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final service = locator.get<UserRepository>();
  UserModel _users = UserModel();
  UserModel get users => _users;

  Future<void> getAllUsers() async {
    _users = await service.getAll();
    notifyListeners();
  }
}
