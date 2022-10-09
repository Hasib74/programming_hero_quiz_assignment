import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/home/bloc/home_cubit.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';

import '../../../main.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        if (state is CurrentQuizState) {
          print("Current state : ${state.index}");
          sl<GameFunctions>().currentQuiz = state.index ?? 0;

          print(
              "Image :: ${sl<HomeFunctions>().quizeModel!.questions![sl<GameFunctions>().currentQuiz].questionImageUrl}");
        }

        return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [
                BoxShadow(spreadRadius: 0.7, blurRadius: 1),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                sl<HomeFunctions>()
                    .quizeModel!
                    .questions![sl<GameFunctions>().currentQuiz]
                    .question!,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              if (sl<HomeFunctions>()
                      .quizeModel!
                      .questions![sl<GameFunctions>().currentQuiz]
                      .questionImageUrl !=
                  null)
                if (sl<HomeFunctions>()
                        .quizeModel!
                        .questions![sl<GameFunctions>().currentQuiz]
                        .questionImageUrl
                        .toString()
                        .endsWith("null") ==
                    false)
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                        sl<HomeFunctions>()
                            .quizeModel!
                            .questions![sl<GameFunctions>().currentQuiz]
                            .questionImageUrl,
                      ),
                      // fit: BoxFit.cover,
                    ),
                  )
            ],
          ),
        );
      },
    );
  }
}
