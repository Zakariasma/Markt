import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/env.dart';

import '../domain/user.dart';
import '../domain/userDTO.dart';
import 'package:markt/token/token_manage.dart';

class UserProvider {

  final tokenManage = TokenManage();

  Future<void> createUser(UserDTO user) async {
    final response = await http.post(Uri.parse('${baseUrl}api/user'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(user.toJson()));
    if (response.statusCode == 200) {
      tokenManage.saveAccessToken(json.decode(response.body)['token']);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> login(UserDTO user) async {
    final response = await http.post(
      Uri.parse('${baseUrl}api/user/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }


}
