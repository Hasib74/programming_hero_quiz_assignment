import 'package:flutter/material.dart';
import 'package:programmin_hero/core/routes/app_routes.dart';
import 'package:programmin_hero/core/utils/app_spaces.dart';
import 'package:programmin_hero/presentation/_common/widgets/app_button.dart';
import 'package:programmin_hero/presentation/home/sectios/header_logo.dart';
import 'package:programmin_hero/presentation/home/sectios/high_score.dart';

import '../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderLogo(),
          AppSpaces.spacesHeight25,
          HighScore(),
          AppSpaces.spacesHeight25,
          AppButton(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.GAME_SCREEN);
            },
            title: "Let's Start",
            height: 40,
          )
        ],
      ),
    );
  }
}
