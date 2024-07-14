import 'package:flutter/material.dart';
import 'package:weather_app/theme/colorscheme.dart';

ThemeData themeDatalight = ThemeData(
  colorScheme: lightColorScheme, 
  useMaterial3: true, 
  fontFamily: 'Overlock', 
  
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true, 

  ), 
  // platform: TargetPlatform.android
  //this for target platform theme -->>
); 

ThemeData themeDatadark = ThemeData(
  colorScheme: darkColorScheme, 
  
  useMaterial3: true, 
  fontFamily: 'Overlock', 
  
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true, 
    toolbarHeight: 70

  ), 
  // platform: TargetPlatform.android
  //this for target platform theme -->>
); 