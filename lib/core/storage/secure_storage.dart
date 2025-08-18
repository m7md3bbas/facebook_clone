import 'dart:convert';
import 'package:facebook_clone/features/auth/model/saved_account.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedAccountsManager {
  static const _accountsKey = "saved_accounts";
  static final _secureStorage = FlutterSecureStorage();

  static Future<void> saveAccount(
    SavedLoginAccount account,
    String refreshToken,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final accountsJson = prefs.getStringList(_accountsKey) ?? [];
    final accounts = accountsJson
        .map((e) => SavedLoginAccount.fromJson(json.decode(e)))
        .toList();

    accounts.removeWhere((a) => a.userId == account.userId);
    accounts.add(account);

    await prefs.setStringList(
      _accountsKey,
      accounts.map((a) => json.encode(a.toJson())).toList(),
    );

    await _secureStorage.write(
      key: "token_${account.userId}",
      value: refreshToken,
    );
  }

  static Future<List<SavedLoginAccount>> loadAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getStringList(_accountsKey) ?? [];
    return accountsJson
        .map((e) => SavedLoginAccount.fromJson(json.decode(e)))
        .toList();
  }

  static Future<String?> getToken(String userId) async {
    return await _secureStorage.read(key: "token_$userId");
  }

  static Future<void> deleteAccount(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getStringList(_accountsKey) ?? [];
    final accounts = accountsJson
        .map((e) => SavedLoginAccount.fromJson(json.decode(e)))
        .toList();

    accounts.removeWhere((a) => a.userId == userId);

    await prefs.setStringList(
      _accountsKey,
      accounts.map((a) => json.encode(a.toJson())).toList(),
    );

    await _secureStorage.delete(key: "token_$userId");
  }
}
