import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPref;
  static String kToken='kToken';
  static Future<void> sharedInit() async {
    sharedPref=await SharedPreferences.getInstance();
  }
  static void setString(String key,String value){
    sharedPref.setString(key, value);
  }
  static String? getString(String key){
    return sharedPref.getString(key);
  }
  static void setToken(String? token){
    if(token==null){
      return;
    }
    setString(kToken, token);
  }
  static String?  getToken(){
    return getString(kToken);
  }
}