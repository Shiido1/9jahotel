import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:ninejahotel/ui/screens/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService._internal();

  SharedPreferences? sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  static SharedPreferencesService get instance => _instance;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String logginKey = 'loggin';
  static const String logginKeyFb = 'logginFb';
  static const String userData = 'user';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';

  bool get isLoggedIn => sharedPreferences?.getBool(logginKey) ?? false;
  bool get isLoggedInFb => sharedPreferences?.getBool(logginKeyFb) ?? false;
  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences!.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  set isLoggedIn(bool logging) =>
      sharedPreferences?.setBool(logginKey, logging);
  set isLoggedInFb(bool loggingFb) =>
      sharedPreferences?.setBool(logginKeyFb, loggingFb);

  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);

  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));

  Future<bool> logOut(context) async {
    try {
      await sharedPreferences!.clear();
      await FacebookAuth.instance.logOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>  FirstScreen()));
      // await locator<HiveManager>().clearAllBox();
      // getLogger('logout').d(sharedPreferences.toString());
      return true;
    } catch (e) {
      // getLogger("error clearing cache").d('logout');
      return false;
    }
  }
}
