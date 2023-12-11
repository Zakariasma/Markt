import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class TokenManage{

  final storage = FlutterSecureStorage();

  void saveAccessToken(String token) async {
    await storage.write(key: 'accessToken', value: token);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
  }
}