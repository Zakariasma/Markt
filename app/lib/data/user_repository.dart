import 'package:markt/provider/user_provider.dart';

import '../domain/user.dart';
import '../domain/userDTO.dart';


class UserRepository {
  final userProvider = UserProvider();

  Future<void> createUser(UserDTO user) async {
    try {
      await userProvider.createUser(user);
    } catch (e) {
      print('Failed to create product: $e');
    }
  }

  Future<void> login(UserDTO user) async {
    try {
      await userProvider.login(user);
      print('User logged successfully');
    } catch (e) {
      print('Failed to login: $e');
    }
  }

}
