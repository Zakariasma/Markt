import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

final storage = FlutterSecureStorage();

class TokenManager {

  static Future<bool> isTokenValid() async {
    String? token = await storage.read(key: 'accessToken');
    print(token);
    if (token != null) {
      List<String> parts = token.split('.');
      String payload = parts[1];
      String paddedPayload = payload.padRight((payload.length + 3) & ~3, '=');
      String decoded = utf8.decode(base64Url.decode(paddedPayload));
      Map<String, dynamic> data = json.decode(decoded);
      print(data);
      final int? expirationTimestamp = data['exp'];

      if (expirationTimestamp != null) {
        final int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        return expirationTimestamp > currentTimestamp;
      }
    }
    return false;
  }

  static Future<Map<String, dynamic>?> extractTokenData() async {
    String? token = await storage.read(key: 'accessToken');
    if (token != null) {
      List<String> parts = token.split('.');
      String payload = parts[1];
      String paddedPayload = payload.padRight((payload.length + 3) & ~3, '=');
      String decoded = utf8.decode(base64Url.decode(paddedPayload));
      Map<String, dynamic> data = json.decode(decoded);
      return data;
    }
    return null;
  }

  static void saveAccessToken(String token) async {
    await storage.write(key: 'accessToken', value: token);
  }

  static Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
  }
}
