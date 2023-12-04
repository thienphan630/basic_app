
// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const ACCESS_TOKEN = "ACCESS_TOKEN";
const REFRESH_TOKEN = "REFRESH_TOKEN";
const USERNAME = "USERNAME";
const PASSWOrD = "PASSWOrD";
const ACCOUNT_INFO = "ACCOUNT_INFO";

class LocalStorage {
  final SharedPreferences sharedPreferences;
  LocalStorage({required this.sharedPreferences});

  String? getAccessToken() {
    return sharedPreferences.getString(ACCESS_TOKEN);
  }

  void saveAccessToken(String accessToken) {
    sharedPreferences.setString(ACCESS_TOKEN, accessToken);
  }

  String? getRefreshToken() {
    return sharedPreferences.getString(REFRESH_TOKEN);
  }

  void saveRefreshToken(String refreshToken) {
    sharedPreferences.setString(REFRESH_TOKEN, refreshToken);
  }

  String? getUsername() {
    return sharedPreferences.getString(USERNAME);
  }

  void saveUsername(String username) {
    sharedPreferences.setString(USERNAME, username);
  }

  String? getPassword() {
    return sharedPreferences.getString(PASSWOrD);
  }

  void savePassword(String password) {
    sharedPreferences.setString(PASSWOrD, password);
  }

  void clearStorage() {
    sharedPreferences.clear();
  }

  // void saveAccountInfo(AccountResponseModel accountResponseModel) {
  //   String encodedMap = json.encode(accountResponseModel.toJson());
  //   sharedPreferences.setString(ACCOUNT_INFO, encodedMap);
  // }

  // AccountResponseModel getAccountInfo() {
  //   final data = sharedPreferences.getString(ACCOUNT_INFO);
  //   return AccountResponseModel().fromJson(json.decode(data));
  // }
}
