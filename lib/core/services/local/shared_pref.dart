import 'dart:convert';

import 'package:qr_code/features/login/data/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPref;
  static String kToken='kToken';
  static String kUserName = 'kFleetStaffName';
  static String kUserInfo = 'kUserInfo';
  static String kBiometricEnabled = 'kBiometricEnabled';
  static String kLoggedIn = 'kLoggedIn';
  static Future<void> sharedInit() async {
    sharedPref=await SharedPreferences.getInstance();
  }
  static Future<void> setString(String key,String value){
    return sharedPref.setString(key, value);
  }
  static void setUser(LoginResponse? userData){
    if(userData==null){
      return ;
    }
    else{
      var json=userData.toJson();
      var userString=jsonEncode(json);
      setString(kUserInfo, userString);
    }
  }
  static  LoginResponse? getUser() {
    var userJson = getString(kUserInfo);
    if (userJson==null||userJson.isEmpty) {
      return null;
    }
    var user = jsonDecode(userJson);
    var data = LoginResponse.fromJson(user);
    return data;
  }
  static String? getString(String key){
    return sharedPref.getString(key);
  }
  static Future<bool> setBool(String key,bool value){
    return sharedPref.setBool(key, value);
  }
  static bool? getBool(String key){
    return sharedPref.getBool(key);
  }
  static void setToken(String? token){
    if(token==null||token.isEmpty){
      return;
    }
    setString(kToken, token);
  }
  static String getToken(){
    return getString(kToken)??"";
  }
  static Future<void> setBiometricEnabled(bool? value) async {
    await setBool(kBiometricEnabled, value??false);
  }

  static bool getBiometricEnabled (){
    return getBool(kBiometricEnabled) ?? false;
  }
  static Future<void> setLoggedIn(bool value) async {
    await setBool(kLoggedIn, value);
  }

  static bool  getLoggedIn (){
    return getBool(kLoggedIn) ?? false;
  }

}