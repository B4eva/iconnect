import 'package:iconnect/core/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String SharedPreferencesUserLogedInKey = 'ISLOGGEDIN';
  static String SharedPreferencesUserNameKey = 'USERNAMEKEY';
  static String SharedPreferencesUserEmailKey = 'EMAILKEY';

  // saving data to sharedpreferences

  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(SharedPreferencesUserLogedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SharedPreferencesUserNameKey, userName);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SharedPreferencesUserEmailKey, email);
  }

  // getting data from sharedPreference

  static Future<bool?> getUserLoggedInFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(SharedPreferencesUserLogedInKey);
  }

  static Future<String?> getUserNameFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SharedPreferencesUserNameKey);
  }

  static Future<String?> getUserEmailFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SharedPreferencesUserEmailKey);
  }
}
