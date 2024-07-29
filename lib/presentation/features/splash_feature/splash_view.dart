import 'package:flutter/material.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/core/config/page_route_names.dart';
import 'package:test_layout_switch/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => navigatorKey.currentState?.pushReplacementNamed(PageRouteName.home),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/img/shenron_splash.jpeg",
        width: Constants.mediaQuery.width,
        height: Constants.mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
