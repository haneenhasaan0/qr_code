import 'package:flutter/material.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode themeMode=SharedPref.getBool('isDark')==true?ThemeMode.dark:ThemeMode.light;
   void changeTheme(ThemeMode newTheme){
    if(themeMode==newTheme){
      return;
    }
      themeMode=newTheme;
    SharedPref.setBool('isDark', newTheme==ThemeMode.dark);

    notifyListeners();
  }
}