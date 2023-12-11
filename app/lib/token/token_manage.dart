import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class TokenManager {

  Future<bool> isTokenValid() async {
    final token = await storage.read(key: 'accessToken');
    if (token != null) {
      final Map<String, dynamic> tokenData = json.decode(token);
      final int? expirationTimestamp = tokenData['exp'];

      if (expirationTimestamp != null) {
        final int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        return expirationTimestamp > currentTimestamp;
      }
    }
    return false;
  }

  Future<Map<String, dynamic>?> extractTokenData() async {
    final token = await storage.read(key: 'accessToken');
    if (token != null) {
      final Map<String, dynamic> tokenData = json.decode(token);
      return tokenData;
    }
    return null;
  }

  void saveAccessToken(String token) async {
    await storage.write(key: 'accessToken', value: token);
  }
  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
  }
}
