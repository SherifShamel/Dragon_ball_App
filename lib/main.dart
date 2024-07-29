import 'package:flutter/material.dart';

import 'core/config/page_route_names.dart';
import 'core/config/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
