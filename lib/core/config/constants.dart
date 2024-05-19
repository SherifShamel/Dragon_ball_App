import 'package:flutter/material.dart';

import '../../main.dart';

class Constants {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF004182),
  );

  static const String baseUrl = "https://dragonball-api.com/";
}
