import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/env.dart';

import '../domain/user.dart';
import '../domain/userDTO.dart';

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

}
