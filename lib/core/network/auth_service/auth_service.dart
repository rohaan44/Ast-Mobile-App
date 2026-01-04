

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class AuthStorage {
  static const _tokenKey = "auth_token";
  static const _userIdKey = "user_id";

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true, // Secure for Android
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // SAVE TOKEN
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // GET TOKEN
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // DELETE TOKEN
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // SAVE USER ID
  static Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // GET USER ID
  static Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  // CLEAR ALL AUTH DATA
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
