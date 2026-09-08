import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/core/app_theme/app_theme.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.light;
   void changeTheme(ThemeMode newTheme){
    if(themeMode==newTheme){
      return;
    }
      themeMode=newTheme;

    notifyListeners();
  }
}