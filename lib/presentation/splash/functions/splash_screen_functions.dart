import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/routes/app_routes.dart';
import 'package:programmin_hero/data/localDataSource/score_data_source.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/home/bloc/home_cubit.dart';

import '../../../main.dart';

class SplashScreenFunctions {
  init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    sl<GameFunctions>().hightScore = sl<ScoreDataSource>().getScore() ?? "0";

    await BlocProvider.of<HomeCubit>(context).getQuizData();

    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.HOME_SCREEN, (route) => false);
  }
}
