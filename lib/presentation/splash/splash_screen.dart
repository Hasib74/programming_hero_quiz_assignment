import 'package:flutter/material.dart';
import 'package:programmin_hero/core/utils/app_assets.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';
import 'package:programmin_hero/main.dart';
import 'package:programmin_hero/presentation/splash/functions/splash_screen_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<SplashScreenFunctions>().init(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image(image: AssetImage(AppAssets.logo)),
        ),
      ),
    );
  }
}
