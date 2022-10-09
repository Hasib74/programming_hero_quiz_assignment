import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';

import '../../../main.dart';

class Progress extends StatelessWidget {
  Progress({Key? key}) : super(key: key);

  double? _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 10,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                width: (_width! /
                        (sl<HomeFunctions>().quizeModel!.questions!.length)) *
                    sl<GameFunctions>().currentQuiz,
                child: Container(
                  //width: 0.1,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
