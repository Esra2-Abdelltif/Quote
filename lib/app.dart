import 'package:flutter/material.dart';
import 'package:qoutes/config/routes/app_routes.dart';
import 'package:qoutes/core/utils/app_strings.dart';
import 'config/themes/app_dark_themes.dart';
class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: getThemeDataDark(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      // routes: routes,
      //home: const QuoteScreen(),
    );
  }
}