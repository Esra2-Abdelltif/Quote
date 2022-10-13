import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/core/utils/app_strings.dart';

ThemeData getThemeDataDark() => ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroungColor,
    fontFamily: AppStrings.fontFamily,

    textTheme: const TextTheme(
     // bodyText2: TextStyle(color: AppColors.white),
      bodyMedium:  TextStyle(color: AppColors.white,height: 1.3,fontSize: 22,
          fontWeight: FontWeight.bold
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleSpacing: 15,
       titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      color: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white),
      //backgroundColor:AppColors.darkBackgroungColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBackgroungColor,
        statusBarIconBrightness: Brightness.light,
      ),
    )
);