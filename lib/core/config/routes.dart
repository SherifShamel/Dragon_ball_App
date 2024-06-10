import 'package:flutter/material.dart';

import '../../presentation/features/home_feature/pages/home_view.dart';
import '../../presentation/features/single_character_feature/pages/character_view.dart';
import '../../presentation/features/splash_feature/splash_view.dart';
import 'page_route_names.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case PageRouteName.home:
        {
          return MaterialPageRoute(
            builder: (context) => const HomeView(),
          );
        }
      case PageRouteName.character:
        {
          return MaterialPageRoute(
            builder: (context) =>  const CharacterView(),
            settings: settings,
          );
        }
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
