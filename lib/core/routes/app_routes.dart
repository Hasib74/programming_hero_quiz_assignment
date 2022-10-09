import 'package:flutter/material.dart';
import 'package:programmin_hero/presentation/game/game_screen.dart';
import 'package:programmin_hero/presentation/home/home_screen.dart';
import 'package:programmin_hero/presentation/result/result_screen.dart';
import 'package:programmin_hero/presentation/splash/splash_screen.dart';

class AppRoutes {
  static String SPLASH_SCREEN = "/";
  static String HOME_SCREEN = "/home";
  static String GAME_SCREEN = "/game_screen";
  static String RESULT_SCREEN = "/result_scrren";

  static getAppRoutes() {
    return {
      SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
      HOME_SCREEN: (BuildContext context) => const HomeScreen(),
      GAME_SCREEN: (BuildContext context) => const GameScreen(),
      RESULT_SCREEN: (BuildContext context) => const ResultScreen(),
    };
  }
}
