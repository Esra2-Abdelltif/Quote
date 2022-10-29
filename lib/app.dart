import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/config/locale/app_localizations_setup.dart';
import 'package:qoutes/config/routes/app_routes.dart';
import 'package:qoutes/core/utils/app_strings.dart';
import 'package:qoutes/feature/splash_screen/presentation/cubit/locale_cubit.dart';
import 'package:qoutes/injection_container.dart';
import 'config/themes/app_dark_themes.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<LocaleCubit>()..getSavedLang()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appTitle,
              theme: getThemeDataDark(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              // routes: routes,
              //home: const QuoteScreen(),
              locale: state.locale,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}
