import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/env.dart';

import '../domain/user.dart';
import '../domain/userDTO.dart';
import 'package:markt/token/token_manage.dart';

class UserProvider {

  Future<void> createUser(UserDTO user) async {
    final response = await http.post(Uri.parse('${baseUrl}api/user'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(user.toJson()));
    if (response.statusCode == 200) {
      print('User created successfully');
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> login(UserDTO user) async {
    print(user.toString());
    final response = await http.post(
      Uri.parse('${baseUrl}api/user/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      TokenManager.saveAccessToken(json.decode(response.body)['token']);
    } else {
      throw Exception(response.statusCode);
    }
  }


}
