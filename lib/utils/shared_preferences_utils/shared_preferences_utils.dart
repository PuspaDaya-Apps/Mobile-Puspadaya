import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_name.dart';

class SharedPrefUtils {
  //!OnBoarding
  Future<void> storedOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefName.ONBOARDING, true);
  }

  Future<bool?> getOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefName.ONBOARDING);
  }

  Future<void> removeOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.ONBOARDING);
  }

  //!Account
  Future<void> storedAccount(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefName.ACCOUNT, value);
  }

  Future<String?> getAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.ACCOUNT);
  }

  Future<void> removeAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.ACCOUNT);
  }

  //!RefreshToken
  Future<void> storedRefreshToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefName.REFRESHTOKEN, value);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.REFRESHTOKEN);
  }

  Future<void> removeRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.REFRESHTOKEN);

    String? a = prefs.getString(SharedPrefName.REFRESHTOKEN);
    debugPrint(a);
  }

  //!AccessToken
  Future<void> storedAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefName.ACCESSTOKEN, value);
  }

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.ACCESSTOKEN);
  }

  Future<void> removeAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.ACCESSTOKEN);

    String? a = prefs.getString(SharedPrefName.ACCESSTOKEN);
    debugPrint(a);
  }

  //!Current User
  Future<void> storedCurrentUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefName.CURRENTUSER, value);
  }

  Future<String?> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.CURRENTUSER);
  }

  Future<void> removeCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.CURRENTUSER);

    String? a = prefs.getString(SharedPrefName.CURRENTUSER);
    debugPrint(a);
  }

  //!RegisterOrangTuaAyah
  Future<void> storedRegisterOrangTuaAyah(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefName.REGISTER_ORANG_TUA_AYAH, value);
  }

  Future<String?> getRegisterOrangTuaAyah() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.REGISTER_ORANG_TUA_AYAH);
  }

  Future<void> removeRegisterOrangTuaAyah() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.REGISTER_ORANG_TUA_AYAH);

    String? a = prefs.getString(SharedPrefName.REGISTER_ORANG_TUA_AYAH);
    debugPrint(a);
  }

  //!RegisterOrangTuaIbu
  Future<void> storedRegisterOrangTuaIbu(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefName.REGISTER_ORANG_TUA_IBU, value);
  }

  Future<String?> getRegisterOrangTuaIbu() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.REGISTER_ORANG_TUA_IBU);
  }

  Future<void> removeRegisterOrangTuaIbu() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefName.REGISTER_ORANG_TUA_IBU);

    String? a = prefs.getString(SharedPrefName.REGISTER_ORANG_TUA_IBU);
    debugPrint(a);
  }
}
