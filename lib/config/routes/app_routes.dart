

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/core/utils/app_strings.dart';
import 'package:qoutes/feature/random_quote/presentaion/cubit/randomquotes_cubit.dart';
import 'package:qoutes/feature/random_quote/presentaion/screens/quote_screen.dart';
import 'package:qoutes/feature/splash_screen/presentation/pages/splash.dart';
import 'package:qoutes/injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}
//------------Frist way
// final routes = {
//   Routes.initialRoute: (context) => const QuoteScreen(),
//   Routes.randomQuoteRoute: (context) => const FavoriteScreen()

//-----at material app
// routes: routes,

//at navogate
// Navigator.pushName(contex,Routes.randomQuoteRoute);
// };
//----------Second way w deh el a7sn
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => getIt<RandomQuoteCubit>()),
            child: const QuoteScreen(),
          );
        }));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
